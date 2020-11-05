//
//  UUID+extension.swift
//  ios-gox
//
//  Created by Willa on 05/08/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension UUID{
    
    /// Get message unique id, with prefix "IOS-"
    /// - Returns: string of message unique id with prefix IOS-
    func chatMessageUUID() -> String{
        return "IOS-" + self.uuidString
    }
}
