//
//  Formatter+Extension.swift
//  ios-gox
//
//  Created by Willa on 13/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension Formatter{
    
    /// Format three digit separator wiith .
    static let withThreeDigitsDotSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter
    }()
}
