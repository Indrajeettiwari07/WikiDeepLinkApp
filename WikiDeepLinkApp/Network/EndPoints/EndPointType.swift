//
//  EndPointType.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

// Defines Endpoint to provide required properties for any API endpoint
protocol EndPointType {
	var baseURL         : URL { get }
	var httpMethod      : HTTPMethod { get }
	var task            : HTTPTask { get }
	var cachingPolicy   : URLRequest.CachePolicy { get }
}

