//
//  SearchHistoryCoordinatorTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchHistoryCoordinatorTest: XCTestCase {
	var sut: SearchHistoryCoordinator!
    override func setUpWithError() throws {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
		  let sceneDelegate = windowScene.delegate as? SceneDelegate
		else {
		  return
		}
		
		guard let window = sceneDelegate.window else {
			return
		}
		
		let search = Screen.SearchHistory.viewController as? SearchHistoryViewController
		
		let navigationController = UINavigationController(rootViewController: search ?? UIViewController())
		window.rootViewController = navigationController
		
		sut = SearchHistoryCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
		sut = nil
    }
	
	func testStart() {
		sut.start()
		XCTAssertNotNil(sut.navigationController)
		XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
	}

}
