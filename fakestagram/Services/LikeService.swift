//
//  LikeService.swift
//  fakestagram
//
//  Created by Jose Olvera on 02/01/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation

class LikeService {
    
    //private let client = RestClient<Like>(client: Client.fakestagram, basePath: "/api/v1/posts/\(miLike.idUser)/like")
    
    func call(idFoto: Int?, success: @escaping (Int?) -> Void) {
        
        let miLike = Like(
            idFoto: idFoto
        )
        
        
        let client = RestClient<Like>(client: Client.fakestagram, basePath: "/api/v1/posts/\(miLike.idFoto!)/like")
        
        client.create(miLike){ post in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(post?.idFoto)
        }
    }

}
