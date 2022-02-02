////
////  UIImageViewExtensionTests.swift
////  ImageLoaderTests
////
////  Created by David Dahina on 12/30/21.
////
//
//import Foundation
//import UIKit
//import XCTest
//@testable import ImageLoader
//
//final class UIImageViewExtensionTests: XCTestCase {
//    private var sut: UIImageView!
//    private var imageLoaderMock: ImageLoaderMock!
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        sut = UIImageView()
//        imageLoaderMock = ImageLoaderMock()
//    }
//    override func tearDownWithError() throws {
//        sut = nil
//        imageLoaderMock = nil
//        try super.tearDownWithError()
//    }
//    func testDownloadImageWhenURLIsCorrectShuldReternLoadedImage() {
//        // given
//        imageLoaderMock.mockedImage = UIImage()
//        // when
//        sut.loadImage(url: "test", imageLoader: imageLoaderMock)
//        // then
//        XCTAssertEqual("imageName", sut.accessibilityIdentifier)
//    }
//    func testDownloadImageWhenURLIsemptyShuldReternErrorImage() {
//        // given
//        imageLoaderMock.mockedImage = nil
//        // when
//        sut.loadImage(url: "", imageLoader: imageLoaderMock)
//        // then
//        XCTAssertEqual("errorName", sut.accessibilityIdentifier)
//    }
//    func testDownloadImageWhenURLIsIncorrectShuldReternErrorImage() {
//        // given
//        imageLoaderMock.mockedImage = nil
//        // when
//        sut.loadImage(url: "test", imageLoader: imageLoaderMock)
//        // then
//        XCTAssertEqual("errorName", sut.accessibilityIdentifier)
//    }
//    func testDownloadImageWhenURLIsCorrectWithCustomPlaceholderShuldReternLoadedImage() {
//        // given
//        imageLoaderMock.mockedImage = UIImage()
//        // when
//        sut.loadImage(url: "test", imageLoader: imageLoaderMock)
//        // then
//        XCTAssertEqual("imageName", sut.accessibilityIdentifier)
//    }
//
//}
//
