//
//  UIResponder+Extension.swift
//  ios-gox
//
//  Created by Willa on 07/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIResponder {
    
    /// Get a view controller
    var viewController: UIViewController? {
        if let vc = self as? UIViewController {
            return vc
        }

        return next?.viewController
    }
}
