//
//  UIStackView+Extension.swift
//  ios-gox
//
//  Created by Willa on 31/05/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIStackView{
    
    
    /// Remove all arrangedSubView inside stackview
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
