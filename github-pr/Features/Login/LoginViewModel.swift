//
//  LoginViewModel.swift
//  github-pr
//
//  Created by Alex Acebo on 5/9/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import AuthenticationServices

class LoginViewModel {
    var code: String?
    var token: String?
    
    var onAuthComplete: (() -> Void)?
    
    func authenticate(_ delegate: ASWebAuthenticationPresentationContextProviding) {
        login.getCode(delegate) {
            (code) in
            if let code = code {
                self.code = code
                login.getToken(code) { (token) in
                    if let token = token {
                        self.token = token
                        
                        if let onComplete = self.onAuthComplete {
                            onComplete()
                        }
                    }
                }
            }
        }
    }
}
