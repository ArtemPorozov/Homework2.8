//
//  Homework2_8App.swift
//  Homework2.8
//
//  Created by Артем Порозов on 18.01.2022.
//

import SwiftUI

@main
struct Homework1_4App: App {
    
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NewsScreenViewModel())
                .environmentObject(CustomNavScreenViewModel())
        }
    }
    
}
