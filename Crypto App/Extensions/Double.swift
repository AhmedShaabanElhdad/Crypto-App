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
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        switch num {
        case 1_000_000_000_000... :
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
            
        case 1_000_000_000... :
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
            
        case 1_000_000... :
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
            
        case 1_000... :
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        default:
            return "\(sign)\(self)"
        }
    }
}
