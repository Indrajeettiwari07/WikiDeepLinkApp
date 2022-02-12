//
//  SearchViewModel.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

struct SearchViewModel {
	private let locations: LocationModel.PlaceData
	
	init(_ locations: LocationModel.PlaceData) {
		self.locations = locations
	}
}

extension SearchViewModel {
	
	var locationName: String {
		guard let name = locations.name else {
			let title = "\(locations.lat)" + "," + "\(locations.long)"
			return title
		}
		
		return name
	}
}
