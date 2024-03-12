//  Converters+Extensions.swift
//  Crypto-APP
//  Created by Leonardo Oliveira on 08/03/24.

import Foundation

extension Double {
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.currencyCode = "USD"

        if let formattedValue = formatter.string(from: NSNumber(value: self)) {
            return formattedValue
        } else {
            return "\(self)"
        }
    }
}
