//
//  Wikipedia_URLProvider.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation
import UIKit

// MARK: URLProvider Protocol
protocol URLProvider {
	//var baseURL: URL { get }
	func urlWithQueryItem(forValue value: String, key: String) -> URL?
	func canOpen(_ url: URL) -> Bool 
}

struct Wikipedia_URLProvider {

	//MARK: Properties
	let baseURLString: String
	let host: String?


	init(baseURLString: String, host: String? = nil) {
		self.baseURLString = baseURLString
		self.host = host
	}
}


// MARK: URLProvider methods
extension Wikipedia_URLProvider: URLProvider {

	func urlWithQueryItem(forValue value: String, key: String) -> URL? {
		var urlComponents = URLComponents(string: "\(baseURLString)")

		if let host = self.host {
			urlComponents?.host = host
		}
		let queryItem = URLQueryItem(name: key, value: value)
		urlComponents?.queryItems = [queryItem]

		return urlComponents?.url
	}
	
	// Method to check if the url can be opened
	func canOpen(_ url: URL) -> Bool {
		return  UIApplication.shared.canOpenURL(url)
	}
}
