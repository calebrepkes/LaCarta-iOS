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

class SessionLogin {
		var username: String 
		var password: String
		
		init(username: String, password: String) {
			self.username = username
			self.password = password
		}
	
		func loginUser() -> (successStatus: Bool, responseMessage: HttpStatusStruct) {
			var successStatus = false
			var responseMessage = http200Status
			
			let headers = [
				"content-type": "application/json",
				"cache-control": "no-cache",
				"postman-token": "e5c1b05c-7cf7-b0e7-c4b5-8336a4c7dd81"
			]
			let parameters = [
				"username": self.username,
				"password": self.password
				] as [String : Any]
			
			let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
			
			let request = NSMutableURLRequest(url: NSURL(string: "https://lacarta-backend.herokuapp.com/app/login")! as URL,
			                                  cachePolicy: .useProtocolCachePolicy,
			                                  timeoutInterval: 10.0)
			request.httpMethod = "POST"
			request.allHTTPHeaderFields = headers
			request.httpBody = postData as Data
			
			let session = URLSession.shared
			let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
				if (error != nil) {
					print(error ?? "Failure")
				} else {
					let httpResponse = response as? HTTPURLResponse
					let statusCode = httpResponse!.statusCode
					print("Starting the switch statement to determine responseMessage output")
					switch(statusCode) {
					case 200:
						print("The status code is: \(http200Status.statusCode) and the description is: \(http200Status.description)")
						successStatus = true
						responseMessage = (http200Status)
					case 400:
						print("The status code is: \(http400Error.statusCode) and the description is: \(http400Error.description)")
						successStatus = false
						responseMessage = http400Error
					case 500:
						print("The status code is: \(http500Error.statusCode) and the description is: \(http500Error.description)")
						successStatus = false
						responseMessage = (http500Error)
					default:
						successStatus = false
						responseMessage = (http999Error)
					}
//					print("Print the responseMessage: \(responseMessage)")
//					print("statusCode:  \(httpResponse!.statusCode)")
//					print(httpResponse ?? "Response success")
					
				}
			})
			
			dataTask.resume()
			
			return (successStatus, responseMessage)
			
		}
	}
	
