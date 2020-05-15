//
//  AuthView.swift
//  github-pr
//
//  Created by Alex Acebo on 5/8/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import SwiftUI
import UIKit

struct LoginView: UIViewControllerRepresentable {
    let onAuthComplete: (() -> Void)?
    
    func makeUIViewController(context: Context) -> LoginViewController {
        let controller = LoginViewController()
        controller.onAuthComplete = self.onAuthComplete
        return controller
    }
    
    func updateUIViewController(_ loginViewController: LoginViewController, context: Context) {
        // do stuff here
    }
    
    typealias UIViewControllerType = LoginViewController
}
