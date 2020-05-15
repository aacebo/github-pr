//
//  LoginViewModel.swift
//  github-pr
//
//  Created by Alex Acebo on 5/9/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import Foundation
import AuthenticationServices

class LoginViewModel {
    private let _decoder = JSONDecoder()
    
    func authenticate(
        _ delegate: ASWebAuthenticationPresentationContextProviding,
        onComplete: @escaping () -> Void
    ) {
        login.getCode(delegate) {
            (code) in
            if let code = code {
                state.login.code = code
                login.getToken(code) { (token) in
                    if let token = token {
                        state.login.token = token
                        UserDefaults.standard.set(token, forKey: LOGIN_TOKEN)
                        onComplete()
                    }
                }
            }
        }
    }
    
    func getAuthUser(onComplete: @escaping () -> Void) {
        github.getAuthUser { (data, response) in
            if let data = data {
                do {
                    state.login.user = try self._decoder.decode(GithubAuthUser.self, from: data)
                    onComplete()
                } catch let error {
                    logger.error(error.localizedDescription)
                }
            }
        }
    }
}
