//
//  SearchHistoryViewTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchHistoryViewTest: XCTestCase {
	var sut: SearchHistoryViewController!
	let presenter = MockSearcHistoryPresenter()
	
    override func setUpWithError() throws {
		sut = Screen.SearchHistory.viewController as? SearchHistoryViewController
		presenter.viewController = sut
		sut.loadView()
		sut.viewDidLoad()
		
    }

    override func tearDownWithError() throws {
		sut = nil
    }
	
	func testSearchHistoryViewHasATableView() {
		XCTAssertNotNil(sut.searchHistoryTableView)
		XCTAssertNotNil(sut.searchHistoryTableView?.delegate)
		XCTAssertNotNil(sut.searchHistoryTableView?.dataSource)
	}
	
	func testSearchViewTableViewConfromsToTableViewDelegateProtocol() {
		XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
		XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
	}
	
	func testSearchHistoryTableViewConformsToTableViewDataSourceProtocol() {
		XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
		XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
		XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
	}
	
	func testNumberOfRows() {
		presenter.viewController?.showSearchedList(["Amsterdam"])
		let expectationToTestNumberOfRows = expectation(description: "Test after 1.0 second wait")
		let result = XCTWaiter.wait(for: [expectationToTestNumberOfRows], timeout: 1.0)
		if result == XCTWaiter.Result.timedOut {
			XCTAssertEqual(sut.searchHistoryTableView?.numberOfRows(inSection: 0), 1)
		}
	}
	
	func testSearchHistoryCellReuseIdentifier() {
		presenter.viewController?.showSearchedList(["Amsterdam"])
		let expectationToTestCell = expectation(description: "Test after 1.0 second wait")
		let result = XCTWaiter.wait(for: [expectationToTestCell], timeout: 1.0)
		if result == XCTWaiter.Result.timedOut {
			let searchedHistoryCell = sut.tableView(sut.searchHistoryTableView, cellForRowAt: IndexPath(row: 0, section: 0))
			let actualReuseIdentifier = searchedHistoryCell.reuseIdentifier
			let expectedReuseIdentifier = SearchHistoryCell.reusableIdentifier
			XCTAssertEqual(actualReuseIdentifier, expectedReuseIdentifier)
		}
	}
}
