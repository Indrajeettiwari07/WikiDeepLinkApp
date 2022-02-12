//
//  HTTPURLEncoderTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 11/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class HTTPURLEncoderTest: XCTestCase {

	override func setUpWithError() throws {}

   func test_Parameter() {
		  var urlRequest = URLRequest(url: URL(string: "www.google.com")!)
				 urlRequest.httpMethod = "GET"
				 let params = ["param1": "SampleData", "param2": "Sample data 2"]
				 do {
					 try HTTPURLParameterEncoder.encode(urlRequest: &urlRequest, httpParameters: params)
					XCTAssertTrue(urlRequest.url?.absoluteString == "www.google.com?param1=SampleData&param2=Sample%20data%202" || urlRequest.url?.absoluteString == "www.google.com?param2=Sample%20data%202&param1=SampleData")
			  } catch {
					 XCTFail("URL Encoding failed")
				 }
	  }

}
