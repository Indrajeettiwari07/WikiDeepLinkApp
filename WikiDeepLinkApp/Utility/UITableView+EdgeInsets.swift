//
//  UITableView+EdgeInsets.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 12/02/2022.
//

import UIKit

extension UITableView {

	func updateBottomInset(to value: CGFloat) {
		let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
		self.contentInset = edgeInset
		self.verticalScrollIndicatorInsets = edgeInset
	}
}
