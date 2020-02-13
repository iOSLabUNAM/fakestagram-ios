//
//  CreateLikeService.swift
//  fakestagram
//
//  Created by Ricardo Hernández González on 23/11/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct CreateLike: Codable{
    var postId: Int?
}

class CreateLikeService {
    private let client = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/posts")

    func call(postId: Int?, success: @escaping (Int?) -> Void) {
        let newLike = CreateLike(postId: postId)
        client.create(id: newLike.postId, newLike) { like in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(like?.postId)
        }
    }
}
