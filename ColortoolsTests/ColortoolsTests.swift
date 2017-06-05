//
//  ColortoolsTests.swift
//  ColortoolsTests
//
//  Created by Kevin McGladdery on 6/5/17.
//  Copyright © 2017 Kevin McGladdery. All rights reserved.
//

import XCTest
import Colortools

class ColortoolsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHue() {
        XCTAssertEqualWithAccuracy(UIColor.blue.hue!, 0.6666666, accuracy: 0.01)
    }
    
    func testBrightness() {
        XCTAssertEqualWithAccuracy(UIColor.white.brightness!, 1.0, accuracy: 0.01)
    }
    
}
