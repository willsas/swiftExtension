//
//  Array+Extension.swift
//  ios-gox
//
//  Created by Willa on 02/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension Array {
    
    /// Get value in optional
    public subscript(safe index: Int) -> Element?{
        guard startIndex <= index && index < endIndex else {
            return nil
        }
        return self[index]
    }
    
    /// Get value after index  but optional
    public subscript(after index: Int) -> Element?{
        guard startIndex <= index && index < endIndex else {
            return nil
        }
        return self[index + 1]
    }
    
    
    /// Check if array is not empty
    public var isNotEmpty: Bool{
        return !self.isEmpty
    }
}

extension Array where Element: Equatable {
    
    /// Add object to the array if the value si new
    /// In order to make this work, if the array is custom object, the object must comform to Equatable
    /// - Parameter item: new value
    mutating func addObjectIfNew(_ item: Element) {
        if !contains(item) {
            append(item)
        }
    }
}
