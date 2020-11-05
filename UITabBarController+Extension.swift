//
//  UITabBar+Extension.swift
//  ios-gox
//
//  Created by Willa on 04/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UITabBarController{
    
    
    public func setupViewController(vc: [UIViewController], titles: [String]?, icons: [UIImage]?){
        for vc in vc{
            self.addChild(vc)
        }
        
        if vc.count == titles?.count, vc.count == icons?.count{
            if let titles = titles{
                for (index, element) in titles.enumerated(){
                    self.tabBar.items![index].title = element
                }
            }
            if let icons = icons{
                for (index,element) in icons.enumerated(){
                    self.tabBar.items![index].image = element
                }
            }
            
        }else{
            for (index, vc) in vc.enumerated(){
                let vcName = String(describing: vc)
                self.tabBar.items![index].title = vcName.replacingOccurrences(of: "ViewController", with: "")
            }
        }
    }
}
