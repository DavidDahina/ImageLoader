//
//  URLSessionMock.swift
//  ImageLoaderTests
//
//  Created by David Dahina on 12/30/21.
//

import Foundation
@testable import ImageLoader

final class URLSessionMock: SessionProtocol {
    var mockedData: Data?
    var mockedError: Error?
    var recivedURL: URL?
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        let data = self.mockedData
        let error = self.mockedError
        recivedURL = url
        completionHandler(data, nil, error)
        return DataTaskMock()
    }
}
