//
//  LikeService.swift
//  fakestagram
//
//  Created by Ago Moviles on 1/17/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation

struct CreatingLike: Codable {
    let id: Int?
}

class LikeService {
    
    func call(id: Int?, success: @escaping (Int?) -> Void) {
        
        let newLike = CreatingLike(id:id)
        let client = RestClient<CreatingLike>(client: Client.fakestagram, basePath: "/api/v1/posts/ \(newLike.id!)/like")
        
        debugPrint("In Like Service, id:  \(newLike.id!)")
        
        client.create(newLike) { post in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(post?.id)
        }
    }
    
}
