//
//  LoggerService.swift
//  github-pr
//
//  Created by Alex Acebo on 4/30/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import Foundation
import os

let logger = LoggerService()

class LoggerService {
    private let _df = DateFormatter()
    
    init() {
        self._df.dateFormat = "yyyy-MM-dd hh:mm:ss"
    }
    
    func error(_ message: String) {
        self._log(message, type: .error)
    }
    
    func info(_ message: String) {
        self._log(message, type: .info)
    }
    
    func log(_ message: String) {
        self._log(message, type: .default)
    }
    
    private func _timestamp() -> String {
        return "[\(self._df.string(from: Date()))] - "
    }
    
    private func _log(_ message: String, type: OSLogType) {
        #if DEBUG
        print("\(self._timestamp())\(type == OSLogType.error ? "❗️" : "")\(message)")
        #else
        os_log(message, type: type)
        #endif
    }
}
