//
//  CreateLikeService.swift
//  fakestagram
//
//  Created by Luis Alberto Gachuz Morales on 23/11/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

struct CreateLike: Codable {
    let id: Int
}

//protocol Geolocable {
//    func update(coordinate: CLLocationCoordinate2D?)
//}

class CreateLikeService {
    
   // let client = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/like/")
    
    func call(id: Int, success: @escaping (Int?) -> Void) {
        let newLike = CreateLike(
            id:id
        )
        
        let client = RestClient<CreateLike>(client: Client.fakestagram, basePath: "/api/v1/posts/ \(newLike.id)/like")
        
        print("LGMMMMMMMMMMMMMMMM  \(newLike.id)")
        
        
        client.create(newLike) { post in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(post?.id)
        }
    }
}
