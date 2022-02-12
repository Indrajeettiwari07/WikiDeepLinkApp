//
//  LocationCell.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

class LocationCell: UITableViewCell {

	@IBOutlet weak var locationName: UILabel!
	
	func configureCell(with viewModel: SearchViewModel) {
		locationName.text = viewModel.locationName
	}

}
