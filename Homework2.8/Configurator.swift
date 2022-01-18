//
//  Configurator.swift
//  Homework2.8
//
//  Created by Артем Порозов on 18.01.2022.
//

import Foundation

class Configurator {
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addServices(service: ArticlesAPI())
//        ServiceLocator.shared.addServices(service: DataStorage())
    }
}
