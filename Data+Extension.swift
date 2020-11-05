//
//  Data+Extension.swift
//  ios-gox
//
//  Created by Willa on 06/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension Data{
    
    /// Set a data to UIImage
    /// - Returns: optional uiimage
    public func toImage() -> UIImage?{
        UIImage(data: self)
    }
    
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
