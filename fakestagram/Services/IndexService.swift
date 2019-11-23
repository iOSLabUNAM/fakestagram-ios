//
//  IndexService.swift
//  fakestagram
//
//  Created by LuisE on 11/9/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class IndexService {
    let client = RestClient<[Post]>(client: Client.fakestagram, basePath: "/api/v1/posts")

    func call(success: @escaping ([Post]?) -> Void) {
        client.show(success: success)
    }
}
