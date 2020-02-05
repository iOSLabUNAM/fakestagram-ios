//
//  GetCommentsService.swift
//  fakestagram
//
//  Created by Ma. de Lourdes Chaparro Candiani on 11/23/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class CommentsService {
    
    func getComments(postId: Int, success: @escaping ([Comment]?) -> Void) {
        let client = RestClient<[Comment]>(client: Client.fakestagram, basePath: "/api/v1/posts/\(postId)/comments")
        client.show(success: success)
    }
}
