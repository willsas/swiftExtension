//
//  UIApplication+Extension.swift
//  ios-gox
//
//  Created by Willa on 01/07/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIApplication{
    
    /// Get the top most view controller within UIApplication
    /// - Returns: UIViewController
    func topMostViewController() -> UIViewController? {
        return self.windows.first?.rootViewController?.topMostViewController()
    }
}
