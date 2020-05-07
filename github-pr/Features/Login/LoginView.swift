//
//  LoginView.swift
//  github-pr
//
//  Created by Alex Acebo on 4/30/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    let didClickLogin: (() -> Void)?
    
    var body: some View {
        Button(action: self._onLoginClick) {
            Text("LOGIN")
                .foregroundColor(.white)
                .padding(8)
        }.background(Color(Theme.Primary))
         .cornerRadius(5)
    }
    
    private func _onLoginClick() {
        if (self.didClickLogin != nil) {
            self.didClickLogin!()
        }
    }
}
