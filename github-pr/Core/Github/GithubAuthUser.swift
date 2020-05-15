//
//  GithubAuthUser.swift
//  github-pr
//
//  Created by Alex Acebo on 5/10/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

struct GithubAuthUser: Codable {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let gravatar_id: String
    let url: String
    let type: String
    let site_admin: Bool
    let company: String?
    let location: String?
    let email: String?
    let created_at: String
    let updated_at: String
}
