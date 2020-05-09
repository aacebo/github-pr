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
    var didClickLogin: (() -> Void)?
    private var _button: UIButton!
    private let _model = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._model.onAuthComplete = self._onAuthComplete
        
        self._button = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        self._button.backgroundColor = UIColor.blue
        self._button.setTitle("LOGIN", for: .normal)
        self._button.layer.cornerRadius = 5
        self._button.addTarget(self, action: #selector(self._onButtonClick), for: .touchUpInside)
        
        self.view.addSubview(self._button)
    }
    
    @objc private func _onButtonClick(_sender: UIButton) {
        if (self.didClickLogin != nil) {
            self.didClickLogin!()
        }
        
        self._model.authenticate(self)
    }
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return self.view.window ?? ASPresentationAnchor()
    }
    
    private func _onAuthComplete() {
        logger.log(self._model.token ?? "N/A")
    }
}
