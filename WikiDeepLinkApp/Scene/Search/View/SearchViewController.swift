//
//  SearchViewController.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

protocol SearchViewProtocol: AnyObject {
	func showLocations(with viewModel: [SearchViewModel])
	func showError(with message: String)
	func showURL(with url: URL)
}

class SearchViewController: UIViewController {
	var interactor: SearchInteractorProtocol?
	private var viewModelList: [SearchViewModel] = []
	weak var delegate: Routable?
	
	//MARK: IBOUTlets
	@IBOutlet weak var locationTableView: UITableView!
	@IBOutlet weak var locationTextField: UITextField!
	var searchedText: String = ""
}

extension SearchViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Search"
		configureKeyboardNotifications()
		fetchLocations()
		
	}
	
	private func fetchLocations() {
		interactor?.getLocations()
	}
 
	@IBAction private func searchButtonTapped(_ sender: Any) {
		guard let inputText = locationTextField.text, inputText != "" else {
			showError(with: ErrorHandler.invalidSearch.message)
			return
		}
		
		dismissKeyboard()
		
		interactor?.validate(inputText)
	}
	
	
	private func dismissKeyboard() {
		locationTextField.text = nil
		locationTextField.resignFirstResponder()
	}
}

extension SearchViewController: SearchViewProtocol, AlertService {
	func showLocations(with viewModel: [SearchViewModel]) {
		viewModelList = viewModel
		GCD.runOnMainThread {
			self.locationTableView.reloadData()
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

extension SearchViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let viewModel = viewModelList[indexPath.row]
		let location = viewModel.locationName
		interactor?.validate(location)
	}
}

extension SearchViewController: UITableViewDataSource {
	// Number of rows in tableview
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModelList.count
	}
	
	// Configure Cell
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.reusableIdentifier) as? LocationCell else { return UITableViewCell() }
		let viewModel = viewModelList[indexPath.row]
		cell.configureCell(with: viewModel)
		return cell
	}
}

extension SearchViewController {
	private func configureKeyboardNotifications() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}
	
	@objc private func keyboardWillShow(notification: Notification) {
		if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
			locationTableView.updateBottomInset(to: keyboardHeight)
		}
	}
	
	@objc private func keyboardWillHide(notification: Notification) {
		locationTableView.updateBottomInset(to: .zero) 
	}
}


