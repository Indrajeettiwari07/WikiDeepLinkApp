//
//  MockSearchPresenter.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockSearchPresenter: SearchPresenterProtocol {
	
	var locationsReceived: Bool = false
	var urlReceived: Bool =  false
	var presentError: Bool = false
	weak var viewController: SearchViewProtocol?
	
	func presentLocations(_ locations: LocationModel) {
		locationsReceived = true
	}
	
	func presentURL(_ url: URL) {
		urlReceived = true
	}
	
	func presentError(with message: String) {
		presentError = true
	}
}
