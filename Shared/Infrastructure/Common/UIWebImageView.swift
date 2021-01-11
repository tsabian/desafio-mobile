//
//  UIWebImageView.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 10/01/21.
//

import UIKit

class UIWebImageView: UIImageView {
    
    fileprivate static var ramImageCache = NSCache<NSURL, UIImage>()
    
    static subscript(url: URL) -> UIImage? {
        get {
            guard let currentURL = NSURL(string: url.absoluteString) else {
                return nil
            }
            return ramImageCache.object(forKey: currentURL)
        }
        set {
            guard let currentURL = NSURL(string: url.absoluteString) else {
                return
            }
            if let image = newValue {
                ramImageCache.setObject(image, forKey: currentURL)
            } else {
                ramImageCache.removeObject(forKey: currentURL)
            }
        }
    }
    
    var maxWidth = CGFloat.zero
    var maxHeight = CGFloat.zero
    
    private var defaultImage: UIImage {
        isDefaultImage = true
        return UIImage()
    }
    
    private(set) var isDefaultImage = false
    
    var url: URL? {
        didSet {
            isDefaultImage = false
            image = nil
            guard let url = self.url else {
                image = defaultImage
                return
            }
            if let cached = UIWebImageView[url] {
                image = cached
            } else {
                DispatchQueue.global().async {
                    var resized: UIImage?
                    if let picData = try? Data(contentsOf: url), let downloadedImage = UIImage(data: picData) {
                        if downloadedImage.size.width > self.maxWidth || downloadedImage.size.height > self.maxHeight {
                            resized = ImageProcessor.shared.resize(image: downloadedImage,
                                                                   width: self.maxWidth,
                                                                   height: self.maxHeight) ?? self.defaultImage
                        } else {
                            resized = downloadedImage
                        }
                    } else {
                        resized = self.defaultImage
                    }
                    DispatchQueue.main.async {
                        self.image = resized
                        if !self.isDefaultImage {
                            UIWebImageView[url] = self.image
                        }
                    }
                }
            }
        }
    }
}

// MARK: - UIWebImageView extensions
extension UIWebImageView {
    func clearFromCache() {
        if let currentURL = url {
            UIWebImageView[currentURL] = nil
        }
    }
    func clearAllFromCache() {
        UIWebImageView.ramImageCache.removeAllObjects()
    }
}
