//
//  NetworkRouter.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

struct NetworkRouter {
	
	// Creates and returns a *URLRequest* for the passed API end point in case of failure to create URL request throws *Error*
	// - Parameter endPoint: must be a type confirming *EndPointType* protocol
	private func configureRequest(from endPoint: EndPointType) throws -> URLRequest {
		let baseURL = endPoint.baseURL
		var urlRequest = URLRequest(url: baseURL, cachePolicy: endPoint.cachingPolicy, timeoutInterval: 3.0)
		urlRequest.httpMethod = endPoint.httpMethod.rawValue
		do {
			switch endPoint.task {
			case .request(let urlParams):
				try configureHTTPParameters(urlRequest: &urlRequest, urlParams: urlParams)
			}
			return urlRequest
		} catch  {
			throw error
		}
		
	}
	
	// Configure URLRequest with the query string parameters passed in *HTTPParameters* dictionary
	// - Parameter urlRequest: *URLRequest * to be modified with parameters
	// - Parameter urlParams: type alias for a dictionary of the type [String: Any] with query string parameters
	private func configureHTTPParameters(urlRequest: inout URLRequest,urlParams: HTTPParameters?) throws {
		do {
			if let params = urlParams {
				try HTTPURLParameterEncoder.encode(urlRequest: &urlRequest, httpParameters: params)
			}
		} catch {
			throw error
		}
	}
}

extension NetworkRouter: Router {
	
	// Creates and returns a *URLSessionTask* for the *URLRequest* for the specified API endpoint of the type confirming *EndPointType* protocol
	// - Parameter endPoint: must be a type confirming the *EndPointType* protocol
	// - Parameter completion: completion closure with optional *Data*, *URLResponse* and *Error* objects
	@discardableResult
	func request(endPoint: EndPointType, completion: @escaping NetworkCompletion) -> URLSessionTask? {
		do {
			let urlRequest = try configureRequest(from: endPoint)
			let urlTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
				completion(data, response, error)
			})
			urlTask.resume()
			return urlTask
		} catch {
			completion(nil,nil,error)
		}
		return nil
		
	}
}

