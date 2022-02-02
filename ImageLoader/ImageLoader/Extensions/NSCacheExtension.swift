//
//  NSCacheExtension.swift
//  ImageLoader
//
//  Created by David Dahina on 12/30/21.
//

import Foundation
import UIKit

struct Cache: Caching {
    private let imageCache = NSCache<NSString, UIImage>()
    
    func setObject(_ obj: UIImage, forKey key: NSString) {
        imageCache.setObject(obj, forKey: key)
    }
    
    func object(forKey key: NSString) -> UIImage? {
        imageCache.object(forKey: key)
    }
}
