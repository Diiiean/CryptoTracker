//
//  Float.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 10.09.22.
//

import Foundation

extension Float {
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .decimal
        formatter.formatterBehavior = .default
        return formatter
        
    }
    private var pctChangesFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .percent
        formatter.formatterBehavior = .default
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 3
        return formatter
        
    }
    
    func asPctChangesWithFormatter() -> String {
        let number = NSNumber(value: self)
        let pctString = pctChangesFormatter.string(from: number) ?? "0.00 %"
        return pctString
    }
    
    func asCurrencyWithFormatter() -> String {
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? "$0.00"
    }

}

