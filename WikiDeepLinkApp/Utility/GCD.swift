//
//  GCD.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation


enum GCD {
	/// To run operation on main thread
	static func runOnMainThread(closure: @escaping () -> Void) {
		DispatchQueue.main.async {
			closure()
		}
	}
}
