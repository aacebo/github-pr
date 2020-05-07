//
//  AccountView.swift
//  github-pr
//
//  Created by Alex Acebo on 4/30/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import SwiftUI
import UIKit

struct AccountView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AccountViewController {
        let controller = AccountViewController()
        return controller
    }
    
    func updateUIViewController(_ accountViewController: AccountViewController, context: Context) {
        // do stuff here
    }
    
    typealias UIViewControllerType = AccountViewController
}
