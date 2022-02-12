//
//  SearchCoordinatorTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchCoordinatorTest: XCTestCase {
	
	var sut: SearchCoordinator!

    override func setUpWithError() throws {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
		  let sceneDelegate = windowScene.delegate as? SceneDelegate
		else {
		  return
		}
		
		guard let window = sceneDelegate.window else {
			return
		}
		
		let search = Screen.Search.viewController as? SearchViewController
		
		let navigationController = UINavigationController(rootViewController: search ?? UIViewController())
		window.rootViewController = navigationController
		
		sut = SearchCoordinator(navigationController: navigationController)
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
