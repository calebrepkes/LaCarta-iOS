//
//  session.swift
//  LaCarta
//
//  Created by Caleb on 28/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import Foundation

// MARK: Properties


// MARK: Initialize
//func loginUser(username: String, password: String) -> String {
//		let headers = [
//			"content-type": "application/json",
//			"cache-control": "no-cache",
//			"postman-token": "e5c1b05c-7cf7-b0e7-c4b5-8336a4c7dd81"
//		]
//		let parameters = [
//			"username": username,
//			"password": password
//			] as [String : Any]
//
//		let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
//
//		let request = NSMutableURLRequest(url: NSURL(string: "https://lacarta-backend.herokuapp.com/app/login")! as URL,
//										  cachePolicy: .useProtocolCachePolicy,
//									timeoutInterval: 10.0)
//		request.httpMethod = "POST"
//		request.allHTTPHeaderFields = headers
//		request.httpBody = postData as Data
//
//		let session = URLSession.shared
//		let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//			if (error != nil) {
//				print(error ?? "Failure")
//			} else {
//				let httpResponse = response as? HTTPURLResponse
//				print(httpResponse ?? "Response success")
//			}
//		})
//
//		dataTask.resume()
//	
//		return "You are logged in"
//	
//}

