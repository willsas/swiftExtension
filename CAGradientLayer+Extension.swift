//
//  CAGradientLayer+Extension.swift
//  ios-gox
//
//  Created by Willa on 20/08/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    /// implement gradient layer angle
    /// - Parameter angle: angle in max 360 degree
    func apply(angle : Double) {
        let x: Double! = angle / 360.0
        let a = pow(sinf(Float(2.0 * Double.pi * ((x + 0.75) / 2.0))),2.0);
        let b = pow(sinf(Float(2*Double.pi*((x+0.0)/2))),2);
        let c = pow(sinf(Float(2*Double.pi*((x+0.25)/2))),2);
        let d = pow(sinf(Float(2*Double.pi*((x+0.5)/2))),2);
        
        endPoint = CGPoint(x: CGFloat(c),y: CGFloat(d))
        startPoint = CGPoint(x: CGFloat(a),y:CGFloat(b))
    }
}
