//
//  NetworkHelper.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

enum NetworkError: Error {
	
	// MARK: - Cases
	case dataParseError
	case invalidPath
	case parseError
	case requestError
	case internetError
	case failed
	case noDataFound
	
	var errorDescription:String {
		switch self {
		case .dataParseError, .invalidPath, .parseError, .requestError, .failed, .noDataFound:
			return Translation.NetworkConstant.errorMessage
		case .internetError:
			return Translation.NetworkConstant.noInternetError
		}
	}
}




// For Setting network envoirenment of the app
enum NetworkEnvironment {
	case staging
	case production
	case development
}

// Defines network response status and provides error strings for network request error
enum NetworkResponse: String {
	case success
	case authenticationError    = "Authentication Error"
	case badRequest             = "Bad Request"
	case failed                 = "Network request Failed"
	case noData                 = "No Data Found"
	case unableToDecode         = "Decoding Error"
	case noInternet             = "No Internet Connectivity."
}


// Completion handler to return data and error
typealias NetworkCompletionBlock = (_ data: Data?,_ error: Error?)-> ()


enum ApiEndPoint {
	case locations
	
	// url endpoint for MovieBox apis
	var urlString: String {
		switch self {
		case .locations:
			return "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
		}
	}
}
