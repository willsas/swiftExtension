//
//  NSMutableData+Extension.swift
//  ios-gox
//
//  Created by Willa on 13/09/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension NSMutableData {
    func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
