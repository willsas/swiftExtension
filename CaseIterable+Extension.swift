//
//  CaseIterable+Extension.swift
//  ios-gox
//
//  Created by Willa on 09/06/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension CaseIterable where Self: Equatable {
    
    /// Index of the Character inside string
    var index: Self.AllCases.Index? {
        return Self.allCases.firstIndex { self == $0 }
    }
}
