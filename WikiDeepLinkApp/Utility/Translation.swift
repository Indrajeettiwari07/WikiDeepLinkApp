//
//  Translation.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

struct Translation {
   struct Search {
		static let title = NSLocalizedString("Search", comment: "")
		static let noResult = NSLocalizedString("Your search returned no results", comment: "")
	}
	
	struct SearchHistory {
		   static let title = NSLocalizedString("SearchHistory", comment: "")
	   }
	
	// String Constant
	struct StringConstant {
		static let error =  NSLocalizedString("Error", comment: "")
		static let ok = NSLocalizedString("Ok", comment: "")
	}
	
	// Deep Link Error
	struct DeepLinkError {
		static let invalidUrl = NSLocalizedString("InvalidURL", comment: "")
		static let invalidSearch = NSLocalizedString("invalidSearch", comment: "")
		static let redirectFailure = NSLocalizedString("redirectFailure", comment: "")
	}

	// Network Error
	struct NetworkConstant {
		static let errorMessage = NSLocalizedString("errorMsg", comment: "")
		static let noInternetError =  NSLocalizedString("noInternet", comment: "")
		static let noDataFound =  NSLocalizedString("noDataFound", comment: "")
	}
}


