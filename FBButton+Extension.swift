//
//  FBButton+Extension.swift
//  ios-gox
//
//  Created by Willa on 21/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation
import FacebookLogin

extension FBButton{
    
    /// Override FBButton title
    override open func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            titleLabel?.textAlignment = .center
            setTitle("LOG IN WITH FACEBOOK", for: .normal)
            self.roundCorners(type: .rounded)
        }
    }
}
