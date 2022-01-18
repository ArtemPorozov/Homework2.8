//
//  ContentView.swift
//  Homework2.8
//
//  Created by Артем Порозов on 18.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection: Int = 0
    @State private var isSixthActive: Bool = false
    
    var body: some View {
        TabView(selection: $tabSelection) {
            NewsScreen()
                .tabItem {
                    Label("News Screen", systemImage: "newspaper")
                }
                .tag(0)
            NavigationContainerView(transition: Transition.custom(.slide), content: {
                CustomNavScreen()
            })
                .tabItem {
                    Label("Custom Nav Screen", systemImage: "square.stack.3d.down.right")
                }
                .tag(1)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
