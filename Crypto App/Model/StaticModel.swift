//
//  StaticModel.swift
//  Crypto App
//
//  Created by ahmed shaban on 17.04.2024.
//

import Foundation

struct StatisticModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let value: String
    let precentage: Double?
    
    init(title: String, value: String, precentage: Double? = nil) {
        self.title = title
        self.value = value
        self.precentage = precentage
    }
}
