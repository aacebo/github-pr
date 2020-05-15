//
//  LoginState.swift
//  github-pr
//
//  Created by Alex Acebo on 5/10/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import Foundation

struct LoginState {
    var code: String?
    var token: String?
    var user: GithubAuthUser?
    
    init() {
        self.token = UserDefaults.standard.string(forKey: LOGIN_TOKEN)
    }
}
