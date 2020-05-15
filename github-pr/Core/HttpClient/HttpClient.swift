//
//  HttpClient.swift
//  github-pr
//
//  Created by Alex Acebo on 5/8/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import Foundation

class HttpClient {    
    static func get(_ url: String, onComplete: OnHttpCompleteHandler?) -> URLSessionTask {
        var req = self._getRequestFromUrl(url)
        req.httpMethod = "GET"
        return self._execute(req, onComplete: onComplete)
    }
    
    static func post(_ url: String, data: Data?, onComplete: OnHttpCompleteHandler?) -> URLSessionTask {
        var req = self._getRequestFromUrl(url)
        req.httpMethod = "POST"
        req.httpBody = data
        return self._execute(req, onComplete: onComplete)
    }
    
    static func put(_ url: String, data: Data?, onComplete: OnHttpCompleteHandler?) -> URLSessionTask {
        var req = self._getRequestFromUrl(url)
        req.httpMethod = "PUT"
        req.httpBody = data
        return self._execute(req, onComplete: onComplete)
    }
    
    static func patch(_ url: String, data: Data?, onComplete: OnHttpCompleteHandler?) -> URLSessionTask {
        var req = self._getRequestFromUrl(url)
        req.httpMethod = "PATCH"
        req.httpBody = data
        return self._execute(req, onComplete: onComplete)
    }
    
    static func delete(_ url: String, onComplete: OnHttpCompleteHandler?) -> URLSessionTask {
        var req = self._getRequestFromUrl(url)
        req.httpMethod = "DELETE"
        return self._execute(req, onComplete: onComplete)
    }
    
    private static func _getRequestFromUrl(_ url: String) -> URLRequest {
        var req = URLRequest(url: URL(string: url)!)
        
        req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        if let token = UserDefaults.standard.string(forKey: "AUTH_TOKEN") {
            req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return req
    }
    
    private static func _execute(_ req: URLRequest, onComplete: OnHttpCompleteHandler?) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: req) {
            (data, response, error) in self._onComplete(
                data: data,
                response: response,
                error: error,
                onComplete: onComplete
            )
        }
        task.resume()
        return task;
    }
    
    private static func _onComplete(data: Data?, response: URLResponse?, error: Error?, onComplete: OnHttpCompleteHandler?) {
        if let error = error {
            logger.error(error.localizedDescription)
        }
        
        if let onComplete = onComplete {
            onComplete(data, response)
        }
    }
}
