//
//  MockSearcHistoryPresenter.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockSearcHistoryPresenter: SearchHistoryPresenterProtocol {
	var presentSearchedText = false
	var presentError = false
	var presentURL = false
	
	weak var viewController: SearchHistoryViewProtocol?
	
	func presentSearchedText(_ searchedPlaces: [Places]) {
		presentSearchedText = true
	}
	
	func presentError(with message: String) {
		presentError = true
	}
	
	func presentURL(_ url: URL) {
		presentURL = true
	}	
}
