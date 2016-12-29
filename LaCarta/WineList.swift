//
//  WineList.swift
//  LaCarta
//
//  Created by Caleb on 27/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import Foundation

struct Wine {
	let wineID: String
	let wineName: String
	let userName: String
	let description: String
	let colour: String
	let brewYear: String
	let quantity: String

}

enum SerializationError: Error {
	case missing(String)
	case invalid(String, Any)
}

enum HTTPStatusCode: Int {
	case Continue = 100
	case Success = 200
	case Unauthorized = 401
	case NotFound = 404
}

extension Wine {
	init?(json: [String: Any]) throws {
		// Extract Wine ID
		guard let wineID = json["_id"] as? String else {
			throw SerializationError.missing("wineID")
		}
		// Extract wineName
		guard let wineName = json["wine_Name"] as? String else {
			throw SerializationError.missing("wine_Name")
		}
		// Extract user name of user adding wines
		guard let userName = json["username"] as? String else {
			throw SerializationError.missing("username")
		}
		// Extract description of wine
		guard let description = json["description"] as? String else {
			throw SerializationError.missing("description")
		}
		// Extract colour the wine has
		guard let colour = json["colour"] as? String else {
			throw SerializationError.missing("colour")
		}
		// Extract the year the wine has fermented
		guard let brewYear = json["brew_year"] as? String else {
			throw SerializationError.missing("brew_year")
		}
		// Extract the amount of wines are in storage
		guard let quantity = json["quantity"] as? String else {
			throw SerializationError.missing("quantity")
		}
		
		// Initialize properties
		self.wineID = wineID
		self.wineName = wineName
		self.userName = userName
		self.description = description
		self.colour = colour
		self.brewYear = brewYear
		self.quantity = quantity
		
	}
	
}
//
//let headers = [
//	"content-type": "application/json",
//	"cache-control": "no-cache",
//	"postman-token": "41701ea0-4980-9540-6443-b5b4da6ef0e2"
//]
//let parameters = [
//	"username": "caleb@caleb.com",
//	"token": 9084737
//	] as [String : Any]
//
//let postData = JSONSerialization.data(withJSONObject: parameters, options: [])
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://lacarta-backend.herokuapp.com/app/findWines")! as URL,
//                                  cachePolicy: .useProtocolCachePolicy,
//                                  timeoutInterval: 10.0)
//request.httpMethod = "POST"
//request.allHTTPHeaderFields = headers
//request.httpBody = postData as Data
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//	if (error != nil) {
//		print(error)
//	} else {
//		let httpResponse = response as? HTTPURLResponse
//		print(httpResponse)
//	}
//})
//
//dataTask.resume()
