//
//  UIColor+Extension.swift
//  ios-gox
//
//  Created by Willa on 07/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIColor{
    
    ///28282F
    static var goxNavigationBarColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1843137255, alpha: 1)
    
    ///#323236
    static var goxLightNavigationBarColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.2117647059, alpha: 1)
    
    ///393C43
    static var goxBackgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2352941176, blue: 0.262745098, alpha: 1)
     
    /// 28282F
    static var goxDarkBackgroundColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1843137255, alpha: 1)
    
    /// 393C43
    static var goxTabBarColor = #colorLiteral(red: 0.2235294118, green: 0.2352941176, blue: 0.262745098, alpha: 1)
    
    /// 40444C
    static var goxChatTextField = #colorLiteral(red: 0.2509803922, green: 0.2666666667, blue: 0.2980392157, alpha: 1)
    
    /// FA493B
    static var goxRed = #colorLiteral(red: 0.9803921569, green: 0.2862745098, blue: 0.231372549, alpha: 1)
    
    /// DB4437
    static var googleRed = #colorLiteral(red: 0.8588235294, green: 0.2666666667, blue: 0.2156862745, alpha: 1)
    
    /// 5C79FF
    static var facebookBlue = #colorLiteral(red: 0.3607843137, green: 0.4745098039, blue: 1, alpha: 1)
    
    ///76F481
    static var goxGreen = #colorLiteral(red: 0.462745098, green: 0.9568627451, blue: 0.5058823529, alpha: 1)
    
    ///1A44FB
    static var goxBlue = #colorLiteral(red: 0.1019607843, green: 0.2666666667, blue: 0.9843137255, alpha: 1)
    
    ///D94FF3
    static var goxPurple = #colorLiteral(red: 0.8509803922, green: 0.3098039216, blue: 0.9529411765, alpha: 1)
    
    /// FF3D71
    static var goxDanger = #colorLiteral(red: 1, green: 0.2392156863, blue: 0.4431372549, alpha: 1)
    
    /// EB40FB
    static var goxPink = #colorLiteral(red: 0.9215686275, green: 0.2509803922, blue: 0.9843137255, alpha: 1)
    
    ///4050FB
    static var goxBlueButton = #colorLiteral(red: 0.2509803922, green: 0.3137254902, blue: 0.9843137255, alpha: 1)
    
    /// 7F8AFF
    static var goxBlueChat = #colorLiteral(red: 0.4980392157, green: 0.5411764706, blue: 1, alpha: 1)
    
    /// FFDD80
    static var goxYellow = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.5019607843, alpha: 1)
    
    /// FFAA00
    static var goxYellowWarning = #colorLiteral(red: 1, green: 0.6666666667, blue: 0, alpha: 1)
    
    ///8D9298
    static var goxPlaceholderColor = #colorLiteral(red: 0.5529411765, green: 0.5725490196, blue: 0.5960784314, alpha: 1)
    
    /// 393C43
    static var goxSegmentedControlBackground = #colorLiteral(red: 0.2235294118, green: 0.2352941176, blue: 0.262745098, alpha: 1)
    
    
    /// F55955, EF8E00, 76F481, 41CBBD, 4E63FF
    static var goxRainbowColor: [CGColor] = {
        return [
            UIColor(hex: "F55955").cgColor,
            UIColor(hex: "EF8E00").cgColor,
            UIColor(hex: "76F481").cgColor,
            UIColor(hex: "41CBBD").cgColor,
            UIColor(hex: "4E63FF").cgColor
        ]
    }()
    
    
    /// Set a color with hex code
    /// - Parameters:
    ///   - hex: hex code
    ///   - alpha: alpha
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


