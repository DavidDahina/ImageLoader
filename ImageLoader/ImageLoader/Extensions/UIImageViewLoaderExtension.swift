//
//  UIImageViewLoaderExtension.swift
//  ImageLoader
//
//  Created by David Dahina on 12/30/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    fileprivate func setImageName(named: String) -> UIImage? {
        return UIImage(named: named)
    }
    fileprivate func setImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.image = image
            self.alpha = 0
            UIView.animate(withDuration: 2, delay: 0.5, options: .curveEaseInOut, animations: {
                self.alpha = 1
            })
        }
    }
    public func loadImage(
        url: String,
        imageLoader: ImageLoading = ImageLoader.loader,
        completion: (() -> Void)? = nil
    ) {
        guard let url = URL(string: url) else {
            let image = setImageName(named: "error")
            setImage(image!)
            return
        }
        imageLoader.dowloadImage(url: url) { image in
            image != nil ? self.setImage(image!) : self.setImage(self.setImageName(named: "error")!)
        }
    }
}
