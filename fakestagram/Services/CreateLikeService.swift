//
//  CreateLikeService.swift
//  fakestagram
//
//  Created by Alex on 11/23/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct CreateLike: Codable {
    let postID: Int?
}

class CreateLikeService {
    func call(postID: Int?, success: @escaping (Int?) -> Void) {
        let newLike = CreateLike(
            postID: postID
        )
        
        let client = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/posts/\(newLike.postID!)/like")
        client.create(newLike) { post in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(post?.postID)
        }
    }
}
