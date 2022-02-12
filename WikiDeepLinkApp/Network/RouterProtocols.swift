//
//  RouterProtocols.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

typealias NetworkCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

// Provides interface for network routing
protocol Router{

	@discardableResult
	func request(endPoint: EndPointType, completion: @escaping NetworkCompletion) -> URLSessionTask?
}

