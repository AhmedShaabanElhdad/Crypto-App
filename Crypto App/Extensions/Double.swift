//
//  Double.swift
//  Crypto App
//
//  Created by ahmed shaban on 06.04.2024.
//

import Foundation


extension Double {
    private var  currencyFormatter6 :NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = .current
        numberFormatter.currencySymbol = "$"
        numberFormatter.currencyCode = "usd"
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 6
        return numberFormatter
    }
    
    func asCurrency6Digit() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    func asNumberString() -> String {
        return String(format: "%.2f",self)
    }
    
    func asNumberStringWithPrecentage() -> String {
        return asNumberString() + "%"
    }
}
