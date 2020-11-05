//
//  UIViewController+Extension.swift
//  ios-gox
//
//  Created by Willa on 13/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension UIViewController{
        
    /// used in swipe down to dismiss Vertical limit
    private static var verticalLimit = CGFloat(50)
    /// pangesture for swipe down dismiss
    private static var panGesture: UIPanGestureRecognizer?
    
    private static var dismissCompletion: (() -> Void)? = nil
    
    
    /// Add a gox logo on leftbarButtonItem
    func navigationBarAddGoxLogoLeft() {
         let logoImage = #imageLiteral(resourceName: "goxIconNavbar")
         let logoImageView = UIImageView(image: logoImage)
         logoImageView.contentMode = .left
         let imageItem = UIBarButtonItem(customView: logoImageView)
         let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
         negativeSpacer.width = -25
         viewController?.navigationItem.leftBarButtonItems = [negativeSpacer, imageItem]
     }
    
    
    

    /**
     Add close button to it's vc's navigation controller
     
     * DESCRIPTION: In order to make this works, present view controller need to be a root vc of a new navigation controller, also the viewcontroller must be the first child of navigation controller
    */
    func addCloseButton(){
        if navigationController?.viewControllers.first === self{
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close"), style: .done, target: self, action: #selector(UIViewController.vcDismiss(_:)))
        }
    }
    
    @objc
    private func vcDismiss(_ sender: UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Enable ViewController to swipe down to dismiss with a pan gesture but only in potrait mode
    /// - Parameters:
    ///   - gestureDelegate: listen to the gestrue delegate
    ///   - withGestureReceiverView: the custom gesture receiver, instead of whole ViewController.view
    ///   - onlyEnableTransformOnReceiverView: This will affect if withGestureReceiverView parameters is being set. Set to false  if you want to enable transform animation on whole view. Example TRUE is GoxAlertProfileViewController example false is ChannelViewController. The default  is true
    ///   - Completion: view controller dismiss completion
    /// - Description:
    /// Example
    /// Given withGestureReceiverView and set onlyEnableTransformOnReceiverView to TRUE = GoxMabarAlert, GoxProfileAlert, GoxAlert
    ///  Given withGestureReceiverView and set onlyEnableTransformOnReceiverView to FALSE = ChannelViewController
    func enableSwipeDownToDismiss(gestureDelegate: UIGestureRecognizerDelegate? = nil, withGestureReceiverView view: UIView? = nil, onlyEnableTransformOnReceiverView isViewOnly: Bool = true, completion: (() -> Void)? = nil){
        
        UIViewController.panGesture = UIPanGestureRecognizer(target: self, action: #selector(UIViewController.handleSwipeDismiss(_:)))
        UIViewController.panGesture?.delegate = gestureDelegate
        UIViewController.dismissCompletion = completion
        
        if let view = view{
            
            if !isViewOnly{
                UIViewController.panGesture = UIPanGestureRecognizer(target: self, action: #selector(UIViewController.handleSwipeDismissIgnoreView(_:)))
            }
            
            view.addGestureRecognizer(UIViewController.panGesture!)
            
        }else{
            self.view.addGestureRecognizer(UIViewController.panGesture!)
        }
        
    }
    
    
    @objc
    private func handleSwipeDismissIgnoreView(_ sender: UIPanGestureRecognizer) {
        guard let window = UIApplication.shared.windows.first,
            let windowScene = window.windowScene else {return}

        if windowScene.interfaceOrientation.isPortrait {

            switch sender.state {

            case .changed:
                guard sender.translation(in: view).y >= 0 && sender.translation(in: view).y <= UIViewController.verticalLimit  else {return}
                UIView.animate(withDuration: 0) { [weak self] in
                    guard let self = self else {return}
                    self.view.transform = CGAffineTransform(translationX: 0, y: sender.translation(in: self.view).y)
                }

            case .ended:
                if sender.translation(in: view).y < UIViewController.verticalLimit {
                    UIView.animate(withDuration: 0) { [weak self] in
                        self?.view.transform = .identity
                    }
                }else{
                    view.transform = .identity
                    dismiss(animated: true, completion: UIViewController.dismissCompletion)
                }
            default:
                break
            }

        }
    }
    
    
    @objc
    private func handleSwipeDismiss(_ sender: UIPanGestureRecognizer) {
        guard let window = UIApplication.shared.windows.first,
            let windowScene = window.windowScene else {return}
        
        if windowScene.interfaceOrientation.isPortrait {
            
            switch sender.state {
                
            case .changed:
                
                
                guard sender.translation(in: view).y >= 0 && sender.translation(in: view).y <= UIViewController.verticalLimit  else {return}
                
                
                UIView.animate(withDuration: 0.0, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                    sender.view?.transform = CGAffineTransform(translationX: 0, y: sender.translation(in: sender.view).y)
                })
                
                
            case .ended:
                if sender.translation(in: view).y < UIViewController.verticalLimit {
                    UIView.animate(withDuration: 0) {
                        sender.view?.transform = .identity
                    }
                }else{
                    sender.view?.transform = .identity
                    dismiss(animated: true, completion:  UIViewController.dismissCompletion)
                }
            default:
                break
            }
            
            
            
        }
        
        
        
            
        
        
        
//
//
//
//            case .changed:
//
//
//
//                UIViewController.viewTranslation.y = (sender.translation(in: view).y)
//
//                if UIViewController.viewTranslation.y > 0 && UIViewController.viewTranslation.y >= window.safeAreaInsets.top {
//
//                    UIView.animate(withDuration: 0.0, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseOut, animations: { [unowned self] in
//                        self.view.transform = CGAffineTransform(translationX: 0, y: self.logConstraintValueForYPoisition(yPosition: UIViewController.viewTranslation.y, verticalLimit: UIViewController.verticalLimit - 50))
//                    })
//
//                }
//
//
//            case .ended:
//
//                if UIViewController.viewTranslation.y < UIViewController.verticalLimit {
//                    UIView.animate(withDuration: 0.0, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 1, options: .curveEaseOut, animations: { [unowned self] in
//                        self.view.transform = .identity
//                    })
//                } else { dismiss(animated: true, completion: nil) }
//
//
//            default:
//                break
//            }
//        }else{
//            self.view.transform = .identity
//        }
//
//
//
        
        
    }
    
    
    // basically use log10 logic: 1, 10, 100, 1000, 10000 to create rubber effect
    private func logConstraintValueForYPoisition(yPosition : CGFloat, verticalLimit: CGFloat) -> CGFloat {
      return verticalLimit * (1 + log10(yPosition/verticalLimit))
    }
    

    
    
    /// Get the active most top view controllers
    /// - Returns: active most to view controller
    func topMostViewController() -> UIViewController {
        if let navigation = self as? UINavigationController {
            if let visibleController = navigation.visibleViewController {
                return visibleController.topMostViewController()
            }
        }
            
        if let tab = self as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        
        if self.presentedViewController == nil {
            return self
        }
        
        if let navigation = self.presentedViewController as? UINavigationController {
            if let visibleController = navigation.visibleViewController {
                return visibleController.topMostViewController()
            }
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
    
}
