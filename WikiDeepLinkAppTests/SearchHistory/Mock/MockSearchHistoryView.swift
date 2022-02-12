//
//  MockSearchHistoryView.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockSearchHistoryView: SearchHistoryViewProtocol {
	var searchedList = false
	var showURL = false
	var showError = false
	
	func showSearchedList(_ searchList: [String]) {
		searchedList = true
	}
	
	func showURL(with url: URL) {
		showURL = true
	}
	
	func showError(with message: String) {
		showError = true
	}
	

}
