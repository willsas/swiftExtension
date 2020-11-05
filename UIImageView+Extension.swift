//
//  UIImageView+Extension.swift
//  ios-gox
//
//  Created by Willa on 06/03/20.
//  Copyright © 2020 WillaSaskara. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    
    /// Set imageView to be a gif
    /// - Parameters:
    ///   - frame: image view frame
    ///   - resourceName: gif file name only, without format .gif
    /// - Returns: return optional UIImageView
    static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
    
    
    
    /// Get App icon
    static var appIcon: UIImage? {
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String:Any],
            let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String:Any],
            let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last else { return nil }
        return UIImage(named: lastIcon)
    }
    
    
    /// Set an image on UIimageView with helper of Sd_setImage and compression of https://thumb.gox.id/unsafe
    /// - Parameter url: Image URL
    func setImage(url: String, placeholder image: UIImage? = nil){
        let url = URL(string: Environment().configuration(.goxBaseURLImageCompression) + "/\(url)")!
        sd_setImage(with: url, placeholderImage: image)
    }
}
