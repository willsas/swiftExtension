//
//  Bundle+Extension.swift
//  ios-gox
//
//  Created by Willa on 16/06/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension Bundle {
    
    /// Get the appName
   static var appName: String? {
        return main.infoDictionary![kCFBundleNameKey as String] as? String
    }
    
    /// Get the app version
    static var appVersion: String?{
        return main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    /// Get the build version
    static var buildVersion: String? {
        return main.infoDictionary![kCFBundleVersionKey as String] as? String
    }
}
