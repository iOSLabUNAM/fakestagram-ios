//
//  CreateLikeService.swift
//  fakestagram
//
//  Created by Jhovan Gallardo on 12/02/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation


class CreateLikeService {
    

    let client: Client =  Client.fakestagram

    func call(postId: String, success: @escaping (String?) -> Void) {
        let basePath =  "/api/v1/posts/\(postId)/like"
        client.post(path: basePath, body: nil) { data in
            CodableSerializer<Like>(data: data).async(result: {like in success(like?.createdAt)})
        }
    }
    
    
}
