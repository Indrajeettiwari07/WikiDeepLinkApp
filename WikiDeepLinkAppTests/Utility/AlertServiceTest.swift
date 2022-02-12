//
//  AlertServiceTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 12/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class AlertServiceTest: XCTestCase {
	func testShowAlertView() {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
		  let sceneDelegate = windowScene.delegate as? SceneDelegate
		else {
		  return
		}
		
		guard let window = sceneDelegate.window else {
			return
		}
		
		let search = Screen.Search.viewController as? SearchViewController
		window.rootViewController = search
		
		search?.showError(with: "There seems to be some issue.")
		
		let exp = expectation(description: "Test after 1.5 second wait")
		let result = XCTWaiter.wait(for: [exp], timeout: 1.5)
		if result == XCTWaiter.Result.timedOut {
			XCTAssertNotNil(search?.presentedViewController is UIAlertController)
		}
	}

}
