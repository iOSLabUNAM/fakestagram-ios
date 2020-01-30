//
//  LikeServiceTest.swift
//  Fakestagram-Xcode10Tests
//
//  Created by Pedro Carlos Monzalvo Navarro on 30/01/20.
//  Copyright © 2020 unam. All rights reserved.
//

import XCTest
@testable import Fakestagram_Xcode10

class LikeServiceTest: XCTestCase {

    func testValidRequest(){
        let service = LikeService(withPostID: "105")
        XCTAssertNotNil(service)
    }

}
