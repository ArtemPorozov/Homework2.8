//
//  InjectedWrapper.swift
//  Homework2.8
//
//  Created by Артем Порозов on 19.01.2022.
//

import Foundation
import SwiftUI

@propertyWrapper
struct Injected<T: AnyObject> {
    private var service: T?
    private weak var serviceManager = ServiceLocator.shared
    
    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service = serviceManager?.resolve(type: T.self)
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }

    public var projectedValue: Injected<T> {
        get {return self}
        mutating set {self = newValue}
    }
}
