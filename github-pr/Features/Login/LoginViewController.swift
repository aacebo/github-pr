//
//  AuthViewController.swift
//  github-pr
//
//  Created by Alex Acebo on 5/8/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController, ASWebAuthenticationPresentationContextProviding {
    private let _model = LoginViewModel()
    
    var onAuthComplete: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (state.login.token == nil) {
            let stack = UIStackView(frame: self.view.bounds)
            let button = LoginButton()
            
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fillEqually
            stack.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
            stack.isLayoutMarginsRelativeArrangement = true
            
            button.addTarget(self, action: #selector(self._onButtonClick), for: .touchUpInside)
            stack.addArrangedSubview(button)
            
            self.view.addSubview(stack)
        } else if let onComplete = self.onAuthComplete {
            self._model.getAuthUser {
                onComplete()
            }
        }
    }
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return self.view.window ?? ASPresentationAnchor()
    }
    
    @objc private func _onButtonClick(_sender: UIButton) {
        self._model.authenticate(self) {
            () in self._model.getAuthUser {
                if let onComplete = self.onAuthComplete {
                    onComplete()
                }
            }
        }
    }
}
