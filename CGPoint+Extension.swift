//
//  CGPoint+Extension.swift
//  ios-gox
//
//  Created by Willa on 03/07/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension CGPoint{
    
    /// Get the distance to from given GCPoint
    /// - Parameter to: destination point
    /// - Returns: length distance
    func distanceFrom(_ to: CGPoint) -> CGFloat{
        return (self.x - to.x) * (self.x - to.x) + (self.y - to.y) * (self.y - to.y)
    }
}
