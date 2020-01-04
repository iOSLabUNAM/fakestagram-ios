//
//  CheckSumTest.swift
//  fakestagramTests
//
//  Created by LuisE on 11/9/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import XCTest
//import CryptoKit
@testable import fakestagram

class CheckSumTest: XCTestCase {

    func testPerformanceExample() {
        let text = "lorem ipsum dolor quet sit amet consectetur"
//        let data = text.data(using: .utf8)!
        let expected = "df033ae7d7ff21916308e1e0f52c8f559f76bed69f5b4f8ed6237514bed8e2c4"
        self.measure {
            let result = CheckSum.sha256String(text)
//            let result = String(SHA256.hash(data: data).description.dropFirst(15))
            XCTAssertEqual(expected, result)
        }
    }

}
