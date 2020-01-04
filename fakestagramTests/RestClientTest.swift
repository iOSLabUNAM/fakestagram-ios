//
//  RestClientTest.swift
//  fakestagramTests
//
//  Created by LuisE on 10/11/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import XCTest
import DVR
@testable import fakestagram

class RestClientTest: XCTestCase {
    func testShowPosts() {
        let session = Session(cassetteName: "posts.successful")
        let client = Client(session: session, baseUrl: "https://fakestagram-api.herokuapp.com")
        let restClient = RestClient<[Post]>(client: client, basePath: "/api/v1/posts")
        let exp = expectation(description: "Successfull index posts")

        restClient.show { posts in
            exp.fulfill()
            XCTAssertNotNil(posts)
            XCTAssertEqual(posts!.count, 25)
            XCTAssertEqual(posts!.first!.id, 228)
            XCTAssertEqual(posts!.first!.title, "Example")
        }

        waitForExpectations(timeout: 2, handler: nil)
    }

    func testShowPost() {
        let session = Session(cassetteName: "show_post.successful")
        let client = Client(session: session, baseUrl: "https://fakestagram-api.herokuapp.com")

        let restClient = RestClient<Post>(client: client, basePath: "/api/v1/posts")
        let exp = expectation(description: "Successfull index posts")

        restClient.show(id: "228") { post in
            exp.fulfill()
            XCTAssertNotNil(post)
            XCTAssertEqual(post!.id, 228)
            XCTAssertEqual(post!.title, "Example")
        }

        waitForExpectations(timeout: 2, handler: nil)
    }
}
