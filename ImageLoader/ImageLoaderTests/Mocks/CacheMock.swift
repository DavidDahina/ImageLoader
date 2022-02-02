//
//  CacheMock.swift
//  ImageLoaderTests
//
//  Created by David Dahina on 12/30/21.
//

import Foundation
import UIKit
@testable import ImageLoader

final class CacheMock: Caching {
    var mockedImage: UIImage?
    var recivedIMage: UIImage?
    var didCallOject = false

    func setObject(_ obj: UIImage, forKey key: NSString) {
        recivedIMage = obj
    }
    func object(forKey key: NSString) -> UIImage? {
        didCallOject = true
        return mockedImage
    }
}
