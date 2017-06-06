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
    
    func testSaturation() {
        XCTAssertEqualWithAccuracy(UIColor.white.brightness!, 1.0, accuracy: 0.01)
    }
    
    func testAlpha() {
        XCTAssertEqualWithAccuracy(UIColor.green.alpha!, 1.0, accuracy: 0.01)
    }
    
    func testRed() {
        XCTAssertEqualWithAccuracy(UIColor.red.red!, 1.0, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(UIColor.blue.red!, 0.0, accuracy: 0.01)
    }
    
    func testGreen() {
        XCTAssertEqualWithAccuracy(UIColor.red.green!, 0.0, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(UIColor.green.green!, 1.0, accuracy: 0.01)
    }
    
    func testBlue() {
        XCTAssertEqualWithAccuracy(UIColor.blue.blue!, 1.0, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(UIColor.green.blue!, 0.0, accuracy: 0.01)
    }
    
    func testWhite() {
        XCTAssertEqualWithAccuracy(UIColor.white.white!, 1.0, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(UIColor.gray.white!, 0.5, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(UIColor.black.white!, 0.0, accuracy: 0.01)
    }
    
    func testHexInit() {
        let color = UIColor(hex:0xFF8000FF)
        XCTAssertEqualWithAccuracy(color.red!, 1.0, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(color.green!, 0.5, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(color.blue!, 0.0, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(color.alpha!, 1.0, accuracy: 0.01)
    }
}
