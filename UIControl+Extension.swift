//
//  UIControl+Extension.swift
//  ios-gox
//
//  Created by Willa on 12/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

@objc class ClosureSleeve: NSObject {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    
    
    /// UIControl action with clousure
    /// - Parameters:
    ///   - controlEvents: Control events, default is touchUpIndise
    ///   - closure: colure
    /// - Returns: void
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
