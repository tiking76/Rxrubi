//
//  rubiTests.swift
//  rubiTests
//
//  Created by 舘佳紀 on 2020/08/21.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import XCTest

class rubiTests: XCTestCase {
    
    var viewController : ViewController!
    
    override class func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateInitialViewController() as? UIViewController
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
