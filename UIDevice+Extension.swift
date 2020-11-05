//
//  UIDevice+Extension.swift
//  ios-gox
//
//  Created by Willa on 09/09/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIDevice {

    enum `Type` {
        case iPad
        case iPhone_unknown
        case iPhone_5_5S_5C
        case iPhone_6_6S_7_8
        case iPhone_6_6S_7_8_PLUS
        case iPhone_X_Xs
        case iPhone_Xs_11_Pro_Max
        case iPhone_Xr_11
        case iPhone_11_Pro
    }

    
    /// return if the current device has home button
    var hasHomeButton: Bool {
        switch type {
        case .iPhone_X_Xs, .iPhone_Xr_11, .iPhone_Xs_11_Pro_Max, .iPhone_11_Pro:
            return false
        default:
            return true
        }
    }

    var type: Type {
        if userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136: return .iPhone_5_5S_5C
            case 1334: return .iPhone_6_6S_7_8
            case 1920, 2208: return .iPhone_6_6S_7_8_PLUS
            case 2436: return .iPhone_X_Xs
            case 2688: return .iPhone_Xs_11_Pro_Max
            case 1792: return .iPhone_Xr_11
            case 2426: return .iPhone_11_Pro
            default: return .iPhone_unknown
        }
        }
        return .iPad
   }
}
