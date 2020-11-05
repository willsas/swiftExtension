//
//  JSONDecoder+Extension.swift
//  ios-gox
//
//  Created by Willa on 28/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    /// Helper function tomake  decode a json more easier
    /// - Parameters:
    ///   - type: object type that want to be decoded
    ///   - object: json object
    ///   - opt: opt option
    /// - Throws: error
    /// - Returns: Object decode result
    func decode<T: Decodable>(_ type: T.Type, withJSONObject object: Any, options opt: JSONSerialization.WritingOptions = []) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: object, options: opt)
        return try decode(T.self, from: data)
    }
    
    
}
