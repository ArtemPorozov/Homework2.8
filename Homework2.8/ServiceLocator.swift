//
//  ServiceLocator.swift
//  Homework2.8
//
//  Created by Артем Порозов on 18.01.2022.
//

import Foundation

class ServiceLocator {
    static let shared = ServiceLocator()
    
    lazy var services: [String: AnyObject] = [:]
    
    func addServices<T:AnyObject>(service: T) {
        let key = String(describing: T.self)
        if services[key] == nil {
            services[key] = service
        }
    }
    
    func resolve<T:AnyObject>(type: T.Type) -> T? {
        let key = String(describing: type)
        return services[key] as? T
    }
}
