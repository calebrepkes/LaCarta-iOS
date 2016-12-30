//
//  ViewController.swift
//  LaCarta
//
//  Created by Caleb on 27/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
	
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
	
	
	
	//MARK: Actions
	@IBAction func loginButton(_ sender: UIButton) {
		
		guard let username = usernameTextField.text, let password = passwordTextField.text else {
			print("<<< EMPTY values for login Action. >>>")
			return
		}
		
		let login = SessionLogin(username: username, password: password)
		let answer = login.loginUser()
		
		print(answer.successStatus)
		print(answer.responseMessage)

	}

}
