//
//  UITextField+Extension.swift
//  ios-gox
//
//  Created by Willa on 08/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UITextField {
    
    /// is textfield empty
    var isEmpty: Bool {
        if let text = text, !text.isEmpty {
            return false
        }
        return true
    }
    
    
    /// Add padding to textfield
    /// mocking padding with empty lieftView and emptyRightView
    func padding(){
        let paddingView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

