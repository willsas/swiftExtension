//
//  ScrollableSegmentedControl+Extension.swift
//  ios-gox
//
//  Created by Willa on 08/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

extension ScrollableSegmentedControl{
    
    
    /// Setup scrollable segmented control with given ChannelViewModelItemType
    /// - Parameter items: [ChannelViewModelItemType]]
    func setupChannelSegmented(items: [ChannelViewModelItemType]){
        segmentStyle = .imageOnly
        items.enumerated().forEach { (index, item) in
            switch item{
            case .chat:
                insertSegment(with: #imageLiteral(resourceName: "chatGray"), at: index)
            case .mabar:
                insertSegment(with: #imageLiteral(resourceName: "mabar"), at: index)
            case .weeklySultan:
                insertSegment(with: #imageLiteral(resourceName: "sultanInactive"), at: index)
            case .detailVideo:
                insertSegment(with: #imageLiteral(resourceName: "infoInactive"), at: index)
            }
        }
        
        underlineSelected = true
        segmentContentColor = .goxPlaceholderColor
        selectedSegmentContentColor = .white
        backgroundColor = .goxSegmentedControlBackground
        selectedSegmentIndex = 0
    }
    
    
    /// Setup a ScrollableSegmentedControl in a sticker view
    func setupStickerCategory(){
        segmentStyle = .textOnly
        underlineSelected = true
        segmentContentColor = .goxPlaceholderColor
        selectedSegmentContentColor = .white
        backgroundColor = .goxSegmentedControlBackground
    }
    
}
