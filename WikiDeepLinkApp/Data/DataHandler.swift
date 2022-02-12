//
//  FileHandler.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

protocol DataManagerProtocol {
	func save<T:Codable>(data:T?, fileName:String) -> Bool
	func getData<T: Codable>(from fileName:String, to type: T.Type) -> T?
	func deleteAll(from fileName:String)
}

class DataHandler : DataManagerProtocol, DataModelDecoder {
	
	//MARK: Storing & Retrieving Methods
	
	//Method to be used to store data on disc
	func save<T:Codable>(data:T?, fileName:String) -> Bool{
		
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let fileURL = dir.appendingPathComponent(fileName)
			
			do {
				let data = try JSONEncoder().encode(data)
				try data.write(to: fileURL, options: .atomicWrite)
				return true
			}
			catch {
				return false
			}
		}
		return false
	}
	
	//Method to be used to retrieve data from disc
	func getData<T: Codable>(from fileName:String, to type: T.Type) -> T? {
		
		guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
			return nil
		}
		
		let fileURL = dir.appendingPathComponent(fileName)
		guard let data = try? Data(contentsOf: fileURL, options: .mappedRead) else {return nil}
		
		guard let decodedData =  self.decode(data: data, to: type) else { return nil }
				
		return decodedData
	}
	
	
	//Method to delete all items from disc
	func deleteAll(from fileName:String) {
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			
			let fileURL = dir.appendingPathComponent(fileName)
			do {
				try FileManager.default.removeItem(at: fileURL)
			}
			catch {
				return
			}
		}
	}
	
}
