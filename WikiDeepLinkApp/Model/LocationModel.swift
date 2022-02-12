//
//  LocationModel.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

struct LocationModel: Codable {
	let locations: [PlaceData]
	
	struct PlaceData: Codable {
		let name: String?
		let lat: Double
		let long: Double
	}
}
