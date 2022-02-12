//
//  SearchHistoryCell.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

class SearchHistoryCell: UITableViewCell {
	
	@IBOutlet weak var recentlySearched: UILabel!

	func configureCell(with searchedText: String) {
		recentlySearched.text = searchedText
	}

}
