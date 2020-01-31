//
//  CreateLikeService.swift
//  fakestagram
//
//  Created by Bruno Torres on 23/11/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct CreateLike: Codable {
    let id: String?
}

class CreateLikeService{
    let clientLike = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/posts")

    func createLike(id: String, success: @escaping (CreateLike?) -> Void){
        let newLike = CreateLike(id: id)
        
        clientLike.create(id: "\(id)/like", newLike, success: success)
        print("------------------------")
        clientLike.show(id: "\(id)/likes", success: success)
        print("------------------------")
    }

}
