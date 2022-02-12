//
//  Extension+Data.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

// Data to Model decoder protocol, provides default implementation of method *decodeModel*
protocol DataModelDecoder {}

extension DataModelDecoder {
	
	//Decoding Json data
	func decode<T: Codable>(data: Data?, to type: T.Type, strategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T? {
		guard let data = data else { return nil }
		
		do {
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601
			let baseData = try decoder.decode(type, from: data)
			return baseData
		}
		catch  {
			return nil
		}
	}
}
