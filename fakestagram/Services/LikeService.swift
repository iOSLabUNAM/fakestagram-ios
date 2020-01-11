//
//  LikeService.swift
//  fakestagram
//
//  Created by Javier D-4 on 10/01/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation

class LikeService {
    func getLikes(postID: Int?, success: @escaping (Int?) -> Void) {
        let client = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/posts/\(newLike.postID!)/like")
        client.show(success: success)
    }
    
}
