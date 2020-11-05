//
//  Dictionary+Extension.swift
//  ios-gox
//
//  Created by Willa on 12/09/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation
//
extension Dictionary {
//    public func map<T: Hashable, U>(@noescape transform: (Key, Value) -> (T, U)) -> [T: U] {
//        var result: [T: U] = [:]
//        for (key, value) in self {
//            let (transformedKey, transformedValue) = transform(key, value)
//            result[transformedKey] = transformedValue
//        }
//        return result
//    }
//
//    public func map<T: Hashable, U>(@noescape transform: (Key, Value) throws -> (T, U)) rethrows -> [T: U] {
//        var result: [T: U] = [:]
//        for (key, value) in self {
//            let (transformedKey, transformedValue) = try transform(key, value)
//            result[transformedKey] = transformedValue
//        }
//        return result
//    }
    
    func percentEncoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}
