//
//  Article.swift
//  Homework1.4
//
//  Created by Артем Порозов on 07.01.2022.
//

import Foundation

extension Article: Identifiable {
    public var id: String { url }
}
