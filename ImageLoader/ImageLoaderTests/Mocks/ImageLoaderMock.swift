//
//  ImageLoaderMock.swift
//  ImageLoaderTests
//
//  Created by David Dahina on 12/30/21.
//

import Foundation
import UIKit
@testable import ImageLoader

final class ImageLoaderMock: ImageLoading {
    var didCalldowloadImage = false
    var mockedImage: UIImage?

    func dowloadImage(url: URL, complition: @escaping (UIImage?) -> Void) {
        didCalldowloadImage = true
        complition(mockedImage)
    }
}
