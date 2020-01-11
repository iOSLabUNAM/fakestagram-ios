//
//  CommentService.swift
//  fakestagram
//
//  Created by Javier Ferrer on 1/11/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation

struct CreateComment: Codable {
    let postID: String?
}

class CommentsService {
    func call(postID: String?, success: @escaping (String?) -> Void) {
        let newComment = CreateComment(
            postID: postID
        )

        let client = RestClient<CreateComment>(client: Client.fakestagram, basePath: "/api/v1/posts/\(newComment.postID!)/comments")
        client.create(newComment) { post in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(post?.postID)
        }
    }
}
