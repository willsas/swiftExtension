//
//  UIFont+Extension.swift
//  ios-gox
//
//  Created by Willa on 22/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIFont{
    
    
    /// Get Font Awesome
    /// - Parameter ofSize: size of the font
    /// - Returns: UIFont of font awesome
    static func fontAwesome(_ ofSize: CGFloat) -> UIFont{
        return UIFont(name: "Font Awesome 5 Free", size: ofSize) ?? UIFont()
    }
    
    
    /// Get medium sytem font
    /// - Parameter pointSize: point size
    /// - Returns: medium font
    class func mediumSystemFont(ofSize pointSize: CGFloat) -> UIFont {
        return self.systemFont(ofSize: pointSize, weight: .medium)
    }
    
    
    
    /// HelveticaNeue-Bold
    /// - Parameter size: font size
    /// - Returns: UIFont
    class func helveticaNeueBold(ofSize size: CGFloat) -> UIFont{
        return self.init(name:"HelveticaNeue-Bold", size: size)!
    }
    
    
}
