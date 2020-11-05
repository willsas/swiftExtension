//
//  URL+Extension.swift
//  ios-gox
//
//  Created by Willa on 03/06/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

extension URL{
    
    /// gox://topup
    static var goxTopupURLScheme = URL(string: "gox://topup")! // it must be gox://users/invoice
    
    /// itms-apps://itunes.apple.com/app/id1142114207
    static var ovoAppStoreURL = URL(string: "itms-apps://itunes.apple.com/app/id1142114207")!
    
    /// ovo://
    static var ovoURLScheme = URL(string: "ovo://")!
    
    
    /// Get the query string params
    /// - Parameter param: params
    /// - Returns: query items
    func getQueryStringParameter(param: String) -> String? {
      guard let url = URLComponents(url: self, resolvingAgainstBaseURL: true) else { return nil }
      return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    /// return https://gox.id/{userName}
    static func createGoxStreamerURL(userName: String) -> URL{
        let baseURl = URL(string: Environment().configuration(.goxBaseUrl))!
        return baseURl.appendingPathComponent("/\(userName)")
    }
    
}
