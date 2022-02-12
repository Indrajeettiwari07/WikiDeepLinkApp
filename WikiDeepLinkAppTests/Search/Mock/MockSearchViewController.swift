//
//  MockSearchViewController.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockSearchViewController: SearchViewProtocol {
	var showLocations = false
	var showError = false
	var showURL =  false
	
	func showLocations(with viewModel: [SearchViewModel]) {
		showLocations = true
	}
	
	func showError(with message: String) {
		showError = true
	}
	
	func showURL(with url: URL) {
		showURL = true
	}	
}
