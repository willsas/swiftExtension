//
//  NotificationName+Extension.swift
//  ios-gox
//
//  Created by Willa on 03/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import Foundation

/// This extension  used when an object  need to post or observe to notificaiton center,
/// Observe an object of notification center   that conform to LocalNotificationService
/// Notifwift is current object that handle LocalNotificaitonService
extension Notification.Name {

    /// Type : UserModel
    ///
    /// * Post whenever the SessionServiceFactory.updateUserInstance is called
    /// * Observe, profile cell, edit profile, balance view, or whenever an object need to listen an updated user
    static let userModelData = Notification.Name("userModelNotificationCenter")
    
    /// Type : LiveStreamServiceViewState
    ///
    /// Description:
    /// * Post  in LiveStreamServiceView, Video theme (potrait and landacpe)
    /// * Observe in theme, player itself or wherever who needs to listen or post LiveStreamServiceView state
    static let liveStreamServiceViewState = Notification.Name("liveStreamServiceViewState")
    
    
    
    /// Type : CMTIME
    static let liveStreamServiceViewDuration = Notification.Name("videoPlayerDurationInCMTime")
    
  
    
    /// Type : Int
    ///
    /// Description:
    /// * Post  in WebSocket
    /// * Observe in player to show current viewrs
    static let liveStreamServiceViewTotalViewers = Notification.Name("totalViewers")
    
    
    
    /// Type: Bool always true
    ///
    /// Description:
    /// * post in view controller other than channel view controller, in order to close current pip when new channel vc is present
    static let pipNeedToClose = Notification.Name("pipNeedToClose")
    
    
    
    /// Type: ENUM Mabar Status
    ///
    /// Description:
    /// * post mabar status that get from remote notification service in app delegate
    static let mabarStatus = Notification.Name("mabarStatus")
}
