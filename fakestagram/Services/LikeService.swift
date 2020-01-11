//
//  LikeService.swift
//  fakestagram
//
//  Created by Javier D-4 on 10/01/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation

//class CommentsService {
//
//    func getComments(postId: Int, success: @escaping ([Comment]?) -> Void) {
//        let client = RestClient<[Comment]>(client: Client.fakestagram, basePath: "/api/v1/posts/\(postId)/comments")
//        client.show(success: success)
//    }
//}
//
//struct CreateLike: Codable {
//    let postID: Int?
//}
//
//class CreateLikeService {
//    func call(postID: Int?, success: @escaping (Int?) -> Void) {
//        let newLike = CreateLike(
//            postID: postID
//        )
//
//        let client = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/posts/\(newLike.postID!)/like")
//        client.create(newLike) { post in
//            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
//            success(post?.postID)
//        }
//    }
//}

class LikeService {
    func getLikes(postID: Int?, success: @escaping (Int?) -> Void) {
        let client = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/posts/\(newLike.postID!)/like")
        client.show(success: success)
    }
    
}
