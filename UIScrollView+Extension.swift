//
//  UIScrollView+Extension.swift
//  ios-gox
//
//  Created by Willa on 21/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    
    /// Scroll scrollview to bottom
    /// - Parameter animated: animated
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
    
    
    /// is scrollView reach bottom
    /// - Returns: Boolean
    func isReachBottom() -> Bool{
        self.contentOffset.y >= (self.contentSize.height - self.frame.size.height)
    }
    
    /// is scrollView reach Top
    /// - Returns: Boolean
    func isReachTop() -> Bool{
        self.contentOffset.y == 0
    }
    
//    func contentAndScrollInset(_ inset: UIEdgeInsets){
//        self.contentInset = inset
//        self.scrollIndicatorInsets = inset
//    }
}
