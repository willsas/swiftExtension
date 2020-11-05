//
//  UIAlertController+Extension.swift
//  ios-gox
//
//  Created by Willa on 15/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit


/// Make a custom object that can be used in actionSheetWithItems
protocol UIAlertActionSelectable: class, Equatable {
    associatedtype Value: Codable
    var title: String {get set}
    var value: Value {get set}
    var isSelected: Bool {get set}
    func isSelectedToggle()
}


extension UIAlertController{
    
    /// Show Basic alert
    /// - Parameters:
    ///   - title: titile alert
    ///   - message: message alert
    ///   - vc: view controller to show alert
    static func basicAlert(title: String?, message: String?, vc: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    
    
    /// Show basic alert
    /// - Parameters:
    ///   - title: title alert
    ///   - message: message alert
    ///   - buttonTitle: button title
    ///   - vc: view controller to show alert
    ///   - completion: called as an aciton of the ok button
    /// - Returns: void
    static func basicAlertWithCompletion(title: String?, message: String?, buttonTitle: String?, vc: UIViewController, completion: @escaping (Bool) -> ()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle ?? "OK", style: .default) { (_) in
            completion(true)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    
    
    /// Action sheet of a given list
    /// Provide the array of object that conform to UIAlertActionSelectable protocol and pass it to items, then the completion fired with selected object
    /// - Parameters:
    ///   - title: action sheet item
    ///   - message: action sheet message
    ///   - items: given item, to be the list of acion sheet, that conform to UIAlertActionSelectable
    ///   - vc: view controller to show alert
    ///   - action: called as an aciton of selected items
    static func actionSheetWithItems<A : UIAlertActionSelectable>(title: String? = nil, message: String? = nil, items : [A], vc: UIViewController, action : @escaping (A) -> Void){
        let controller = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        items.forEach { (item) in
            if item.isSelected{
                let action = UIAlertAction(title: item.title + " ✔︎" , style: .default) { (_) in
                    items.forEach {$0.isSelected = false}
                    item.isSelectedToggle()
                    action(item)
                }
                controller.addAction(action)
            }else{
                let action = UIAlertAction(title: item.title, style: .default) { (_) in
                    items.forEach {$0.isSelected = false}
                    item.isSelectedToggle()
                    action(item)
                }
                controller.addAction(action)
            }
        }
        controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        vc.present(controller, animated: true, completion: nil)
    }
    
    
    
    /// Share aciton sheet
    /// - Parameters:
    ///   - items: activity items of type [any]
    ///   - vc: view controller of presenting alert
    static func shareSheets(items: [Any], vc: UIViewController){
        let shareSheet = UIActivityViewController(activityItems: items, applicationActivities: nil)
        shareSheet.popoverPresentationController?.sourceView = vc.view
        vc.present(shareSheet, animated: true, completion: nil)
    }
    
}
