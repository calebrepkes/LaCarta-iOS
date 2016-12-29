//
//  LaCartaTests.swift
//  LaCartaTests
//
//  Created by Caleb on 27/12/2016.
//  Copyright © 2016 Caleb. All rights reserved.
//

import XCTest
@testable import LaCarta

class LaCartaTests: XCTestCase {
    
	//MARK: Wine Class Tests
	
	// Confirm that the Wine initializer returns a Wine object when passed valid parameters
	func testWineInitializationSucceeds() {
		// Dumb name
		let fireWine = Wine.init(wineName: "Fire", photo: nil)
		XCTAssertNotNil(fireWine)

		let waterWine = Wine.init(wineName: "Water", photo: nil)
		XCTAssertNotNil(waterWine)
		
	}
	
	// Confirm that the Wine initializer returns nil when passed invalid parameters
	func testWineInitializationFails() {
		// Empty name
		let emptyWineName = Wine.init(wineName: "", photo: nil)
		XCTAssertNil(emptyWineName)
		
	}
	
    
}
