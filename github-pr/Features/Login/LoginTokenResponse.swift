//
//  LoginTokenResponse.swift
//  github-pr
//
//  Created by Alex Acebo on 5/9/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

struct LoginTokenResponse: Codable {
    let access_token: String
    let token_type: String
    let scope: String?
}
