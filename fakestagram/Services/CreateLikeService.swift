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

    func call(postId: String, success: @escaping (Int?) -> Void) {
        let basePath =  "/api/v1/posts/\(postId)/like"
        client.post(path: basePath, body: nil) { data in
            CodableSerializer(data: data).async(result: success)
        }
    }
    
}
