//
//  Screen.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

enum Screen: String {
	case Search
	case SearchHistory
	
	
	// Below variable is used to return viewcontroller
	var viewController: UIViewController? {
		switch self {
		case .Search:
			let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
			let movieList = storyboard.instantiateViewController(withIdentifier: self.rawValue) as? SearchViewController
			return movieList
		case .SearchHistory:
			let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
			let movieDetail = storyboard.instantiateViewController(withIdentifier: self.rawValue) as? SearchHistoryViewController
			return movieDetail
			
		}
	}
}
