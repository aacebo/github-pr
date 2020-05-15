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
            MainView().edgesIgnoringSafeArea(.top)
        } else {
            LoginView(onAuthComplete: self._onAuthComplete).edgesIgnoringSafeArea(.top)
        }
    }
    
    private func _onAuthComplete() {
        DispatchQueue.main.async {
            self._authenticated = true
        }
    }
}
