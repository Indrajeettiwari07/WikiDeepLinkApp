//
//  SearchViewTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchViewTest: XCTestCase {
	
	var sut: SearchViewController!
	let presenter = MockSearchPresenter()
	let mockViewModelData = [SearchViewModel(LocationModel.PlaceData(name: "",
																	 lat: 1.0,
																	 long: 1.0))]

    override func setUpWithError() throws {
		sut = Screen.Search.viewController as? SearchViewController
		presenter.viewController = sut
		sut.loadView()
		sut.viewDidLoad()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
	
	func testSearchViewHasATableView() {
		XCTAssertNotNil(sut.locationTableView)
		XCTAssertNotNil(sut.locationTableView?.delegate)
		XCTAssertNotNil(sut.locationTableView?.dataSource)
	}
	
	func testSearchViewTableViewConfromsToTableViewDelegateProtocol() {
		XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
		XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
	}
	
	func testSearcViewTableViewConformsToTableViewDataSourceProtocol() {
		XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
		XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
		XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
	}
	
	func testNumberOfRows() {
		presenter.viewController?.showLocations(with: mockViewModelData)
		XCTAssertEqual(sut.locationTableView?.numberOfRows(inSection: 0), 1)
	}
	
	func testLocationCellReuseIdentifier() {
		presenter.viewController?.showLocations(with: mockViewModelData)
		let locationCell = sut.tableView(sut.locationTableView, cellForRowAt: IndexPath(row: 0, section: 0))
		let actualReuseIdentifier = locationCell.reuseIdentifier
		let expectedReuseIdentifier = LocationCell.reusableIdentifier
		XCTAssertEqual(actualReuseIdentifier, expectedReuseIdentifier)
	}
	
	func testEdgeInset() {
		let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: 2.0, right: 0)
		sut.locationTableView.updateBottomInset(to: 2.0)
		XCTAssertEqual(sut.locationTableView.verticalScrollIndicatorInsets, edgeInset)
	}
}
