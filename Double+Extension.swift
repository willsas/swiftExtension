//
//  Double+Extension.swift
//  ios-gox
//
//  Created by Willa on 02/06/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension Double {
    
    /// Covert to  price formated RUPIAH
    var priceRupiahFormatted: String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id_ID")
        return currencyFormatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
