//
//  MainView.swift
//  github-pr
//
//  Created by Alex Acebo on 4/30/20.
//  Copyright © 2020 Alex Acebo. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var _selection = 0
 
    var body: some View {
        TabView(selection: $_selection) {
            PullRequestView()
                .tabItem {
                    VStack {
                        Image("first")
                    }
                }
                .tag(0)
            AccountView()
                .tabItem {
                    VStack {
                        Image("second")
                    }
                }
                .tag(1)
        }
    }
}
