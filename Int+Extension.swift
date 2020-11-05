//
//  Int+Extension.swift
//  ios-gox
//
//  Created by Willa on 06/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension Int{
    
    /// Interger to string
    /// - Returns: return a string
    public func toString() -> String{
        String(self)
    }
    
    /// format an integer to be a three digit separator
    var threeDigitsDotSeparator: String {
        return Formatter.withThreeDigitsDotSeparator.string(for: self) ?? ""
    }
    
    
    /// Given interger of a total second, format it to minutes and second
    var secondToTimeFormated: String{
        let seconds: Int = self % 60
        let minutes: Int = (self / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    
    
    /// Convert large numbers to smaller format
    /// - Source: https://gist.github.com/gbitaudeau/daa4d6dc46517b450965e9c7e13706a3
    /// - Another example:
    /// Value : 598 -> 598
    /// Value : -999 -> -999
    /// Value : 1000 -> 1K
    /// Value : -1284 -> -1.3K
    /// Value : 9940 -> 9.9K
    /// Value : 9980 -> 10K
    /// Value : 39900 -> 39.9K
    /// Value : 99880 -> 99.9K
    func usingKFormat () -> String {
        let numFormatter = NumberFormatter()
        
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K")]
        
        
        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        
        return numFormatter.string(from: NSNumber (value:value))!
    }
    
    
}
