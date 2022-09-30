//
//  String.swift
//  CryptoPrices
//
//  Created by Диана Нуансенгси on 11.09.22.
//

import Foundation

extension String {
    /// Converts a Float into string Representation
    /// ```
    /// Convert 1.234 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
