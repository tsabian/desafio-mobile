//
//  ImageProcessor.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

final class ImageProcessor {
    
    private init() {}
    
    static var shared = ImageProcessor()
    
    func resize(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage? {
        let originalWidth = image.size.width
        let aspectRatio = originalWidth / image.size.height
        var smallSize: CGSize
        if aspectRatio > 1 {
            smallSize = CGSize(width: width, height: height / aspectRatio)
        } else {
            smallSize = CGSize(width: width * aspectRatio, height: height)
        }
        UIGraphicsBeginImageContextWithOptions(smallSize, false, 1)
        image.draw(in: CGRect(x: CGFloat.zero, y: CGFloat.zero, width: smallSize.width, height: smallSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        let cgimage = image.cgImage!
        let contextImage = UIImage(cgImage: cgimage)
        let contextSize = contextImage.size
        var posX = CGFloat.zero
        var posY = CGFloat.zero
        var cgwidth = CGFloat(width)
        var cgheight = CGFloat(height)
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = CGFloat.zero
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = CGFloat.zero
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        let rect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        let imageRef = cgimage.cropping(to: rect)!
        let image = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        return image
    }
}
