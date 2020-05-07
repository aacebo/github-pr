//
//  PullRequestView.swift
//  github-pr
//
//  Created by Alex Acebo on 4/30/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import SwiftUI
import UIKit

struct PullRequestView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PullRequestViewController {
        let controller = PullRequestViewController()
        return controller
    }
    
    func updateUIViewController(_ pullRequestViewController: PullRequestViewController, context: Context) {
        // do stuff here
    }
    
    typealias UIViewControllerType = PullRequestViewController
}
