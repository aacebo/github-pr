//
//  LoginButton.swift
//  github-pr
//
//  Created by Alex Acebo on 5/15/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self._setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self._setup()
    }
    
    private func _setup() {
        self.backgroundColor = Theme.Primary
        self.setTitle("LOGIN", for: .normal)
        self.layer.cornerRadius = 5
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
