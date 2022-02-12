//
//  ErrorHandler.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

enum ErrorHandler: Error {
	case invalidUrl
	case invalidSearch
	case redirectFailure
}

// MARK: ErrorHandler
extension ErrorHandler {

	var message: String {
		let message: String
		switch self {
		case .invalidUrl:
			message = Translation.DeepLinkError.invalidUrl
		case .invalidSearch:
			message = Translation.DeepLinkError.invalidSearch
		case .redirectFailure:
			message = Translation.DeepLinkError.redirectFailure
		}

		return message
	}
}
