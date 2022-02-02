//
//  ImageLoader.swift
//  ImageLoader
//
//  Created by David Dahina on 12/30/21.
//

import UIKit

public protocol SessionProtocol {
    func dataTask(with url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

public protocol ImageLoading {
    func dowloadImage(url: URL, complition: @escaping (UIImage?) -> Void)
}

protocol Caching {
     func setObject(_ obj: UIImage, forKey key: NSString)
     func object(forKey key: NSString) -> UIImage?
}

final public class ImageLoader {
    static public let shared  = ImageLoader()
    static public let loader: ImageLoading = ImageLoader.shared
     var imageCache: Caching
     var session: SessionProtocol

    init(imageCache: Caching = Cache(),
         session: SessionProtocol = URLSession.shared) {
        self.imageCache = imageCache
        self.session = session
    }
}

extension ImageLoader: ImageLoading {
   public func dowloadImage(url: URL, complition: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            complition(cachedImage)
        } else {
            let dataTask = session.dataTask(with: url) { []  data, _, _ in
                guard let data = data, let image = UIImage(data: data) else {
                    complition(nil)
                    return
                }
                complition(image)
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
            }
            dataTask.resume()
        }
    }
}
