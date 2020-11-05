//
//  String+Extension.swift
//  ios-gox
//
//  Created by Willa on 13/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

/// List of animation name in bundle
enum GoxAnimationName{
    static let goxLoadingScreenAnimation = "GoxLoadingScreen"
    static let gox404Animation = "Gox404"
    static let goxSplashScreenAnimation = "GoxSplashScreen"
    static let goxConnectionError = "GoxConnectionError"
}

extension String{
    
    /// the default format is "dd-MM-yyyy"
    func toDate(format: String = "dd-MM-yyyy") -> Date?{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.date(from: self)
    }
    
    /// valid email at least contain aaa@bbb.cc
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    /// if the character more than or equal to  8
    func isValidPassword() -> Bool {
        //Password should contain atleast 8 characters, 1 uppercase and 1 number
        //        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        //        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        //        return passwordValidation.evaluate(with: self)
        return self.count >= 8
    }
    
    /// fist string is 0 or +62 and contain at least 10 digit
    func isValidPhoneNumner() -> Bool{
        return self.count >= 10 && (self.first == "0" || self.prefix(3) == "+62")
    }
    
    /// Trim every white spaces in string, or space
    func trimWhiteSpaces() -> String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// decode html to  string only
    func htmlToString() -> String{
        guard let data = data(using: .utf8) else { return NSAttributedString().string }
        do{
            return try NSAttributedString(data: data, options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil).string
        }catch{
            return NSAttributedString().string
        }
    }
    
    /// yyyy-MM-dd'T'HH:mm:ss.SSSZ to Date
    func utcStringToDate() -> Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let localDate = formatter.date(from: self)
        return localDate
    }
    
    /// decode html to rich text (NSAtributedString)
    func convertHtml() -> NSAttributedString{
           guard let data = data(using: .utf8) else { return NSAttributedString() }
           do{
             return try NSAttributedString(data: data, options: [
                           .documentType: NSAttributedString.DocumentType.html,
                           .characterEncoding: String.Encoding.utf8.rawValue
                       ], documentAttributes: nil)
           }catch{
               return NSAttributedString()
           }
    }
    
    /// Decode Json to Dictionary format
    func jsonToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    /// If string is "" then change it to " "
    func emptyStringToSpace() -> String{
        return self == "" ? " " : self
    }
}
