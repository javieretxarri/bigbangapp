//
//  Extensions.swift
//  BigBangApp
//
//  Created by Javier Etxarri on 22/3/23.
//

import UIKit

extension UIImage {
    func resizeImage(width: CGFloat) -> UIImage? {
        let scale: CGFloat = width / size.width
        let height: CGFloat = size.height * scale
        return preparingThumbnail(of: CGSize(width: width, height: height))
    }

    func resizeImageOld(newwidth: CGFloat) -> UIImage? {
        let scale = newwidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newwidth, height: newHeight))
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newwidth, height: newHeight)))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension Notification.Name {
    static let favoritesChange = Notification.Name("FAVORITECHANGED")
}
