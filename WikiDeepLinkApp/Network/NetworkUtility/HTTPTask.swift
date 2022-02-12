//
//  HTTPTask.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation


// Defines request with *HTTPParameters* for  *URLRequest* query parameters
enum HTTPTask {
	case request(urlParams: HTTPParameters?)
}
