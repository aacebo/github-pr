//
//  AccountViewController.swift
//  github-pr
//
//  Created by Alex Acebo on 4/30/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    private var _button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._button = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        self._button.backgroundColor = UIColor.blue
        self._button.setTitle("poop", for: .normal)
        self._button.layer.cornerRadius = 5
        self._button.addTarget(self, action: #selector(self.buttonClick), for: .touchUpInside)
        
        self.view.addSubview(self._button)
    }
    
    @objc func buttonClick(sender: UIButton) {
        sender.setTitle("ive been hit!", for: .normal)
        logger.log("hit")
    }
}
