//
//  UICollectionView+Extension.swift
//  ios-gox
//
//  Created by Willa on 02/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit


extension UICollectionView{
    
    /// Register custom collection cell to it's collection view
    /// - Parameter type: CollectionViewCell type
    public func register(_ type:UICollectionViewCell.Type){
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }

//    
//    func handleKeyboard(){
//        NotificationCenter.default.addObserver(self, selector: #selector(UICollectionView.keyboardHandler(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(UICollectionView.keyboardHandler(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//    
//    @objc
//    private func keyboardHandler(_ notification: Notification) {
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            if notification.name == UIResponder.keyboardWillShowNotification{
//                                contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.cgRectValue.height, right: 0)
//                scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.cgRectValue.height, right: 0)
//            }else if notification.name == UIResponder.keyboardWillHideNotification{
//                scrollIndicatorInsets = .zero
//                contentInset = .zero
//            }
//        }
//    }
    
}
