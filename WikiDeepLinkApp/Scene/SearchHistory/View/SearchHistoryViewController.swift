//
//  SearchHistoryViewController.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

protocol SearchHistoryViewProtocol: AnyObject {
	func showSearchedList(_ searchList: [String])
	func showURL(with url: URL)
	func showError(with message: String)
}

class SearchHistoryViewController: UIViewController {
	var interactor: SearchHistoryInteractorProtocol?
	weak var delegate: Routable?
	@IBOutlet weak var searchHistoryTableView: UITableView!
	private var searchHistory: [String] = []
}

extension SearchHistoryViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Search History"
	}
	
	override func viewWillAppear(_ animated: Bool) {
		interactor?.getSearchHistory()
	}
}

extension SearchHistoryViewController: SearchHistoryViewProtocol, AlertService {
	func showSearchedList(_ searchList: [String]) {
		GCD.runOnMainThread {
			self.searchHistory.removeAll()
			self.searchHistory = searchList
			self.searchHistoryTableView.reloadData()
		}
	}
	
	func showURL(with url: URL) {
		delegate?.openWikipediaApp(for: url)
	}
	
	func showError(with message: String) {
		self.showAlert(titleStr: Translation.StringConstant.error,
					   messageStr: message,
					   okButtonTitle: Translation.StringConstant.ok,
					   cancelButtonTitle: nil,
					   response: nil)
	}
}

extension SearchHistoryViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		interactor?.validate(searchHistory[indexPath.row])
	}
}

extension SearchHistoryViewController: UITableViewDataSource {
	// Number of rows in tableview
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return searchHistory.count
	}
	
	// Configure Cell
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryCell.reusableIdentifier) as? SearchHistoryCell else { return UITableViewCell() }
		let searchedPlace = searchHistory[indexPath.row]
		cell.configureCell(with: searchedPlace)
		return cell
	}
}
