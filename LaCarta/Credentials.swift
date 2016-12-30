//
//  Credentials.swift
//  LaCarta
//
//  Created by Caleb on 30/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import Foundation

protocol CredentialsProtocol {
	
	var username: String { get set }
	var password: String { get set }
	
}

struct Credentials: CredentialsProtocol {
	var username: String
	var password: String
	
}
