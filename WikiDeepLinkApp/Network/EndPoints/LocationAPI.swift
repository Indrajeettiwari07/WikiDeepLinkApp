//
//  LocationAPI.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

enum LocationAPI {
	case locations
}

extension LocationAPI: EndPointType {
	// For providing base url string based on API type
	private var baseURLString: String {
		switch self {
		case .locations:
			return ApiEndPoint.locations.urlString
			
		}
	}
	
	var baseURL: URL {
		switch self {
		case .locations:
			guard let url = URL(string: baseURLString) else {fatalError("Invalid Base URL.")}
			return url
		}
	}
	
	// To provide HTTP request method to be used in network request
	var httpMethod: HTTPMethod {
		return .get
	}
	
	// To provide request with specific query string parameters if required
	var task: HTTPTask {
		return .request(urlParams: ["":""])
	}
	
	var cachingPolicy: URLRequest.CachePolicy {
		switch self {
		case .locations:
			return .reloadIgnoringLocalCacheData
		}
	}
}
