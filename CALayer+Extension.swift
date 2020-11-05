//
//  CALayer+Extension.swift
//  ios-gox
//
//  Created by Willa on 19/04/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit

enum GoxLayerCornerRadiusType{
    case rounded
    case custom(corners: UIRectCorner, radius: CGFloat)
}


extension CALayer{
    
    
    /// Set a round corner of with layer
    /// - Parameters:
    ///   - corners: selected corner
    ///   - radius: raoius
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11, *) {
            cornerRadius = radius
            maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if(corners.contains(.layerMinXMinYCorner)){
                cornerMask.insert(.topLeft)
            }
            if(corners.contains(.layerMaxXMinYCorner)){
                cornerMask.insert(.topRight)
            }
            if(corners.contains(.layerMinXMaxYCorner)){
                cornerMask.insert(.bottomLeft)
            }
            if(corners.contains(.layerMaxXMaxYCorner)){
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.mask = mask
        }
    }
    
    
    /// Set a round corner of with layer but with preset but only working for rounded
    /// - Parameter type: gox layer corner radius type
    func goxCornerRadius(type: GoxLayerCornerRadiusType){
        switch type {
        case .rounded:
            cornerRadius = self.bounds.height / 2
        case .custom(_, _):
            fatalError("Please only use rounded for goxCornerRadius, custom radous should be use layer.roundCorners")
        }
    }
    
    
    
    enum BorderSide {
        case top
        case right
        case bottom
        case left
        case notRight
        case notLeft
        case topAndBottom
        case all
    }
    
    enum Corner {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    
    
    /// Add a border to the given side
    /// - Parameters:
    ///   - side: Boder side
    ///   - thickness: border width
    ///   - color: border color
    ///   - maskedCorners:CACornerMask, default nil
    func addBorder(side: BorderSide, thickness: CGFloat, color: CGColor, maskedCorners: CACornerMask? = nil) {
        var topWidth = frame.size.width; var bottomWidth = topWidth
        var leftHeight = frame.size.height; var rightHeight = leftHeight
        
        var topXOffset: CGFloat = 0; var bottomXOffset: CGFloat = 0
        var leftYOffset: CGFloat = 0; var rightYOffset: CGFloat = 0
        
        // Draw the corners and set side offsets
        switch maskedCorners {
        case [.layerMinXMinYCorner, .layerMaxXMinYCorner]: // Top only
            addCorner(.topLeft, thickness: thickness, color: color)
            addCorner(.topRight, thickness: thickness, color: color)
            topWidth -= cornerRadius*2
            leftHeight -= cornerRadius; rightHeight -= cornerRadius
            topXOffset = cornerRadius; leftYOffset = cornerRadius; rightYOffset = cornerRadius
            
        case [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]: // Bottom only
            addCorner(.bottomLeft, thickness: thickness, color: color)
            addCorner(.bottomRight, thickness: thickness, color: color)
            bottomWidth -= cornerRadius*2
            leftHeight -= cornerRadius; rightHeight -= cornerRadius
            bottomXOffset = cornerRadius
            
        case [.layerMinXMinYCorner, .layerMinXMaxYCorner]: // Left only
            addCorner(.topLeft, thickness: thickness, color: color)
            addCorner(.bottomLeft, thickness: thickness, color: color)
            topWidth -= cornerRadius; bottomWidth -= cornerRadius
            leftHeight -= cornerRadius*2
            leftYOffset = cornerRadius; topXOffset = cornerRadius; bottomXOffset = cornerRadius;
            
        case [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]: // Right only
            addCorner(.topRight, thickness: thickness, color: color)
            addCorner(.bottomRight, thickness: thickness, color: color)
            topWidth -= cornerRadius; bottomWidth -= cornerRadius
            rightHeight -= cornerRadius*2
            rightYOffset = cornerRadius
            
        case [.layerMaxXMinYCorner, .layerMaxXMaxYCorner,  // All
            .layerMinXMaxYCorner, .layerMinXMinYCorner]:
            addCorner(.topLeft, thickness: thickness, color: color)
            addCorner(.topRight, thickness: thickness, color: color)
            addCorner(.bottomLeft, thickness: thickness, color: color)
            addCorner(.bottomRight, thickness: thickness, color: color)
            topWidth -= cornerRadius*2; bottomWidth -= cornerRadius*2
            topXOffset = cornerRadius; bottomXOffset = cornerRadius
            leftHeight -= cornerRadius*2; rightHeight -= cornerRadius*2
            leftYOffset = cornerRadius; rightYOffset = cornerRadius
            
        default: break
        }
        
        // Draw the sides
        switch side {
        case .top:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            
        case .right:
            addLine(x: frame.size.width - thickness, y: rightYOffset, width: thickness, height: rightHeight, color: color)
            
        case .bottom:
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)
            
        case .left:
            addLine(x: 0, y: leftYOffset, width: thickness, height: leftHeight, color: color)
            
        // Multiple Sides
        case .notRight:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: 0, y: leftYOffset, width: thickness, height: leftHeight, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)
            
        case .notLeft:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: frame.size.width - thickness, y: rightYOffset, width: thickness, height: rightHeight, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)
            
        case .topAndBottom:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)
            
        case .all:
            addLine(x: topXOffset, y: 0, width: topWidth, height: thickness, color: color)
            addLine(x: frame.size.width - thickness, y: rightYOffset, width: thickness, height: rightHeight, color: color)
            addLine(x: bottomXOffset, y: frame.size.height - thickness, width: bottomWidth, height: thickness, color: color)
            addLine(x: 0, y: leftYOffset, width: thickness, height: leftHeight, color: color)
        }
    }
    
    private func addLine(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: CGColor) {
        let border = CALayer()
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        border.backgroundColor = color
        addSublayer(border)
    }
    
    private func addCorner(_ corner: Corner, thickness: CGFloat, color: CGColor) {
        // Set default to top left
        let width = frame.size.width; let height = frame.size.height
        var x = cornerRadius
        var startAngle: CGFloat = .pi; var endAngle: CGFloat = .pi*3/2
        
        switch corner {
        case .bottomLeft: startAngle = .pi/2; endAngle = .pi
            
        case .bottomRight:
            x = width - cornerRadius
            startAngle = 0; endAngle = .pi/2
            
        case .topRight:
            x = width - cornerRadius
            startAngle = .pi*3/2; endAngle = 0
            
        default: break
        }
        
        let cornerPath = UIBezierPath(arcCenter: CGPoint(x: x, y: height / 2),
                                      radius: cornerRadius - thickness,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)
        
        let cornerShape = CAShapeLayer()
        cornerShape.path = cornerPath.cgPath
        cornerShape.lineWidth = thickness
        cornerShape.strokeColor = color
        cornerShape.fillColor = nil
        addSublayer(cornerShape)
    }
    
    
    func addRainbowLayer(){
      
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = UIColor.goxRainbowColor
        gradientLayer.apply(angle: 120)
        
        
        
        let shape = CAShapeLayer()
        shape.lineWidth = 7
        
        // this is according to icon round corner in uiview extension
        shape.path = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: CGSize(width: 10, height: 10), topRightRadius: CGSize(width: 3, height: 3), bottomLeftRadius: CGSize(width: 3, height: 3), bottomRightRadius: CGSize(width: 3, height: 3)).cgPath
        
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        addSublayer(gradientLayer)
        
         
    }
    
    
}
