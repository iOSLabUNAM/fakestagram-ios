//
//  CommentService.swift
//  fakestagram
//
//  Created by Jose Olvera on 04/01/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation


class CommentService {
    
    func call(userComment: String , idFoto: Int?, success: @escaping (Int?) -> Void){
        
        let miComment = Comment(
            userComment: userComment,
            idFoto: idFoto
        )
        
        let client = RestClient<Comment>(client: Client.fakestagram, basePath: "/api/v1/posts/\(miComment.idFoto!)/like")
        
        client.create(miComment){ post in
        NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
        success(post?.idFoto)
        }
    }
    

}
