//
//  LoginService.swift
//  github-pr
//
//  Created by Alex Acebo on 5/9/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import Foundation
import AuthenticationServices

let login = LoginService()

class LoginService {
    private let _base = "\(NSLocalizedString("main", comment: ""))/login/oauth"
    private let _clientId = NSLocalizedString("clientId", comment: "")
    private let _clientSecret = NSLocalizedString("clientSecret", comment: "")
    private let _redirect = NSLocalizedString("loginCallback", comment: "")
    private let _decoder = JSONDecoder()
    private var _session: ASWebAuthenticationSession?
    
    func getCode(_ session: ASWebAuthenticationPresentationContextProviding, onComplete: @escaping (_ code: String?) -> Void) {
        let url = URL(string: "\(self._base)/authorize?client_id=\(self._clientId)&redirect_uri=\(self._redirect)")
        self._session = ASWebAuthenticationSession(
            url: url!,
            callbackURLScheme: nil
        ) {
            (callBack, error) in self._onComplete(callBack: callBack, error: error, onComplete: onComplete)
        }
        self._session?.presentationContextProvider = session
        self._session?.start()
    }
    
    func getToken(_ code: String, onComplete: @escaping (_ token: String?) -> Void) {
        let _ = HttpClient.get(
            "\(self._base)/access_token?client_id=\(self._clientId)&client_secret=\(self._clientSecret)&code=\(code)&redirect_uri=\(self._redirect)"
        ) {
            (data, response) in self._onTokenComplete(data: data, response: response, onComplete: onComplete)
        }
    }
    
    private func _onComplete(callBack: URL?, error: Error?, onComplete: (_ code: String?) -> Void) {
        guard error == nil, let successURL = callBack else {
            return
        }

        let code = NSURLComponents(string: successURL.absoluteString)?.queryItems?.filter({ $0.name == "code" }).first?.value
        onComplete(code)
    }
    
    private func _onTokenComplete(data: Data?, response: URLResponse?, onComplete: (_ token: String?) -> Void) {
        if let data = data {
            do {
                let res = try self._decoder.decode(LoginTokenResponse.self, from: data)
                let token = res.access_token
                onComplete(token)
            } catch let error {
                logger.error(error.localizedDescription)
            }
        }
    }
}
