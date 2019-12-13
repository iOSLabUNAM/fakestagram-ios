//
//  File.swift
//  fakestagram
//
//  Created by Pedro Antonio Vazquez Rodriguez on 10/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//


import Foundation

struct AddLike: Codable{
    var postId: Int?
}

class AddLikeService {
    private let client = RestClient<AddLike>(client: Client.fakestagram, basePath: "/api/v1/posts")

    func call(postId: Int?, success: @escaping (Int?) -> Void) {
        let newLike = AddLike(postId: postId)
        client.createLike(id: newLike.postId, newLike) { like in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(like?.postId)
        }
    }
}

struct AddComent: Codable{
    var postId: Int?
    var content:String?
}


class AddCommentService {
    private let client = RestClient<AddComent>(client: Client.fakestagram, basePath: "/api/v1/posts")

    func call(postId: Int?,content:String?, success: @escaping (Int?) -> Void) {
        let newComment = AddComent(postId: postId,content: content)
        client.createComment(id: newComment.postId, newComment) { comment in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(comment?.postId)
        }
    }
}

class GetCommentService{
 private let client = RestClient<[Comment]>(client: Client.fakestagram, basePath: "/api/v1/posts/")
       func call(postId: Int?, success: @escaping ([Comment]?) -> Void) {
        client.showComments(id:postId,success: success)
    }
}



