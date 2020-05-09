//
//  ContentView.swift
//  github-pr
//
//  Created by Alex Acebo on 4/30/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var _authenticated = false
 
    @ViewBuilder
    var body: some View {
        if (self._authenticated == true) {
            MainView()
        } else {
            LoginView(didClickLogin: self._onLoginClick)
        }
    }
    
    private func _onLoginClick() {
        // self._authenticated = true
    }
}
