//
//  String+Location.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

extension String {

	var isLocation: Bool {
		let allComponent = components(separatedBy: ",")
		guard allComponent.count == 2,
			let first = allComponent.first, Double(first) != nil,
			let second = allComponent.last, Double(second) != nil else {
				return false
		}
		return true
	}
}
