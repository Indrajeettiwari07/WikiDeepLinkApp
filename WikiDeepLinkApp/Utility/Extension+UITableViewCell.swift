//
//  Extension+UITableViewCell.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

extension UITableViewCell {
	static var reusableIdentifier: String {
		return String(describing: self)
	}
}
