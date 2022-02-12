//
//  MockURLProviderService.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockURLProviderService: URLProviderServiceProtocol {
	var showError: Bool =  false
	func getDetails(for place: String, completion: @escaping (Result<URL, ErrorHandler>) -> Void) {
		guard showError else {
			completion(.success(URL(string: "https://google.com")!))
			return
		}
		
		completion(.failure(.invalidSearch))
	}
}
