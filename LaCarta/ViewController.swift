//
//  ViewController.swift
//  LaCarta
//
//  Created by Caleb on 27/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
	
	//MARK: Properties
	
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		usernameTextField.delegate = self
		passwordTextField.delegate = self
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//MARK: UITextFieldDelegate
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// Hide the Keyboard.
		textField.resignFirstResponder()
		return true
	}
	
//	func textFieldDidEndEditing(_ textField: UITextField) {
//		// Do something with the text
//		print("Entered credentials: ",usernameTextField,passwordTextField)
//	}
	
	//MARK: Actions

	@IBAction func loginButton(_ sender: UIButton) {
		let username1 = usernameTextField.text
		let password1 = passwordTextField.text
		

		let answer = loginUser(username2: username1 ?? "", password2: password1 ?? "")
		
		print(answer.consoleLogging)
		print(answer.consoleMessage)

	}

}

let http200Status = (statusCode: 200, description: "OK")
let http400Error = (statusCode: 400, description: "HTTP Error")
let http500Error = (statusCode: 500, description: "Internal server error")

func loginUser(username2: String, password2: String) -> (consoleLogging: String, consoleMessage: (Int, String)) {
	let headers = [
		"content-type": "application/json",
		"cache-control": "no-cache",
		"postman-token": "e5c1b05c-7cf7-b0e7-c4b5-8336a4c7dd81"
	]
	let parameters = [
		"username": username2,
		"password": password2
		] as [String : Any]
	
	let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
	
	let request = NSMutableURLRequest(url: NSURL(string: "https://lacarta-backend.herokuapp.com/app/login")! as URL,
	                                  cachePolicy: .useProtocolCachePolicy,
	                                  timeoutInterval: 10.0)
	request.httpMethod = "POST"
	request.allHTTPHeaderFields = headers
	request.httpBody = postData as Data
	
	var consoleMessage = http200Status
	
	let session = URLSession.shared
	let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
		if (error != nil) {
			print(error ?? "Failure")
			} else {
			let httpResponse = response as? HTTPURLResponse
			let statusCode = httpResponse!.statusCode
			print("Starting the switch statement to determine consoleMessage output")
			switch(statusCode) {
			case 200:
				print("The status code is: \(http200Status.statusCode) and the description is: \(http200Status.description)")
				consoleMessage = (http200Status)
			case 400:
				print("The status code is: \(http400Error.statusCode) and the description is: \(http400Error.description)")
				consoleMessage = http400Error
			case 500:
				print("The status code is: \(http500Error.statusCode) and the description is: \(http500Error.description)")
				consoleMessage = (http500Error)
			default:
				consoleMessage = (999, "Default error with code: \(httpResponse!.statusCode)")
			}
			print("Print the consoleMessage again: \(consoleMessage)")
			print("statusCode:  \(httpResponse!.statusCode)")
			print(httpResponse ?? "Response success")
			
		}
	})

	
//	let http200Status = (statusCode: 200, description: "OK")
//	let http500Error = (statusCode: 500, description: "Internal Server Error")
	
	
	
	dataTask.resume()
	let consoleLogging = "<<< LOG IN SEQUENCE >>>"
	
	
	return (consoleLogging, consoleMessage)
	
}
