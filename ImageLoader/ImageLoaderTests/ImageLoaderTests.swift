//
//  ImageLoaderTests.swift
//  ImageLoaderTests
//
//  Created by David Dahina on 12/30/21.
//

import XCTest
@testable import ImageLoader
@available(iOS 13.0, *)

final class ImageLoaderTest: XCTestCase {
    var mockSession: URLSessionMock!
    var cacheImage: CacheMock!
    var sut: ImageLoader!
    let url = URL(string: "test")!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockSession = URLSessionMock()
        cacheImage = CacheMock()
        sut = ImageLoader(imageCache: cacheImage, session: mockSession)
    }
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testDownloadImageWhenImageCachedShuldReturnImageFromCache() {
        // given
        cacheImage.mockedImage = UIImage()
        cacheImage.mockedImage!.accessibilityIdentifier = "mockedImageName"
        var resultImage: UIImage!
        // when
        sut.dowloadImage(url: url) { image in
            resultImage  = image
        }
        // then
        XCTAssertEqual(resultImage.accessibilityIdentifier, cacheImage.mockedImage!.accessibilityIdentifier)
    }

    func testDowloadImageWhenCacheIsEmptyShuldCacheImage() {
        // given
        //let profileImage = UIImage(named:"error")!
        //let imageData = profileImage.pngData()
        let imageData = UIImage(named: "error")!.pngData()
        mockSession.mockedData = imageData
        sut.dowloadImage(url: url) { _ in
        }
       // then
        XCTAssertNotNil(cacheImage.recivedIMage)

    }

    func testDowloadImageWhenDataIsNilShuldReturnNil() {
        // given
        var resultImage: UIImage!
        // when
        sut.dowloadImage(url: url) { image in
            resultImage = image
        }
        // then
        XCTAssertNil(resultImage)

    }
}

