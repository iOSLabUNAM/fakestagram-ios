//
//  CreatePostService.swift
//  fakestagram
//
//  Created by LuisE on 11/8/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

struct CreatePost: Codable {
    let id: Int?
    let title: String
    let imageData: String?
    let latitude: Double?
    let longitude: Double?
}

//protocol Geolocable {
//    func update(coordinate: CLLocationCoordinate2D?)
//}

class CreatePostService {
    private let client = RestClient<CreatePost>(client: Client.fakestagram, basePath: "/api/v1/posts/")
    private var currentLocation: CLLocationCoordinate2D?

    func call(image: UIImage, title: String, success: @escaping (Int?) -> Void) {
        let newPost = CreatePost(
            id: nil,
            title: title,
            imageData: image.base64(),
            latitude: currentLocation?.latitude,
            longitude: currentLocation?.longitude
        )
        client.create(newPost) { post in
            NotificationCenter.default.post(name: NotificationKeys.didFinishPostCreation.value, object: nil)
            success(post?.id)
        }
    }

    func update(coordinate: CLLocationCoordinate2D?) {
        currentLocation = coordinate
    }
}
