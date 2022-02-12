//
//  MockURLProvider.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 11/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockURLProvider: URLProvider {
	var shouldOpen: Bool =  false
	var baseURL: URL = URL(string: "https://google.com")!
	
	func urlWithQueryItem(forValue value: String, key: String) -> URL? {
		baseURL
	}
	
	func canOpen(_ url: URL) -> Bool {
		shouldOpen
	}
	

}
