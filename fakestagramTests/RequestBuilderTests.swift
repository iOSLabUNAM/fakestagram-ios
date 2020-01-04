//
//  RequestBuilderTests.swift
//  RequestBuilderTests
//
//  Created by LuisE on 9/24/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import XCTest
@testable import fakestagram

class RequestBuilderTests: XCTestCase {
    func testBuildValidURL() {
        var builder = RequestBuilder(baseUrl: "https://example.com/")
        builder.path = "/api/v1/accounts"
        XCTAssertEqual(builder.scheme, "https")
        XCTAssertEqual(builder.method, "get")
        XCTAssertEqual(builder.url(), URL(string: "https://example.com/api/v1/accounts")!)
    }

    func testBuildInvalidURL() {
        var builder = RequestBuilder(baseUrl: "example.com")
        builder.path = "//@3`-"
        XCTAssertNil(builder.url())
    }

    func testBuildForceSchemeURL() {
        let builder = RequestBuilder(baseUrl: "http://example.com/")
        XCTAssertEqual(builder.url(), URL(string: "https://example.com/")!)
    }

    func testBuildOverrideSchemeURL() {
        var builder = RequestBuilder(baseUrl: "http://example.com/")
        builder.scheme = "ftp"
        XCTAssertEqual(builder.url(), URL(string: "ftp://example.com/")!)
    }

    func testBuildInvalidRequest() {
        var builder = RequestBuilder(baseUrl: "example.com")
        builder.path = "//@3`-"
        XCTAssertNil(builder.request())
    }

    func testBuildValidRequest() {
        var builder = RequestBuilder(baseUrl: "https://example.com/")
        builder.path = "/api/v1/accounts"
        builder.method = "post"
        builder.body = "{\"a\": 1}".data(using: .utf8)
        builder.headers = ["test": "example"]

        let result = builder.request()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.httpMethod!, "POST")
        XCTAssertEqual(result!.httpBody!, "{\"a\": 1}".data(using: .utf8))
        XCTAssertEqual(result!.allHTTPHeaderFields!, ["Accept": "application/json", "Content-Type": "application/json", "test": "example"])
    }

    func testBuildValidRequestWithDefaults() {
        let result = RequestBuilder(baseUrl: "https://example.com/").request()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!.httpMethod!, "GET")
        XCTAssertNil(result!.httpBody)
        XCTAssertEqual(result!.allHTTPHeaderFields!, ["Accept": "application/json", "Content-Type": "application/json"])
    }
}
