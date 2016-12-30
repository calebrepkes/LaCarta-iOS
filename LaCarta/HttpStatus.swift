//
//  HttpStatus.swift
//  LaCarta
//
//  Created by Caleb on 30/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import Foundation

//MARK: Properties
protocol HttpStatusProtocol {
	
	var statusCode: Int { get }
	var description: String { get }
	
}

struct HttpStatusStruct: HttpStatusProtocol {
	var statusCode: Int
	var description: String
	
}

//MARK: Initialize
let http200Status = HttpStatusStruct(statusCode: 200, description: "OK")
let http400Error = HttpStatusStruct(statusCode: 400, description: "HTTP Error")
let http500Error = HttpStatusStruct(statusCode: 500, description: "Internal server error")
let http999Error = HttpStatusStruct(statusCode: 999, description: "Default Error")
