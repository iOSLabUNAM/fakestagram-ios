//
//  CameraViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 19/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    let client = RestClient<CreatePost>(client: Client.fakestagram, basePath: "/api/v1/posts")

    @IBAction func onTapCreate(_ sender: UIButton) {
        let img = UIImage(named: "pomememe")!
        let newPost = CreatePost(title: "Karate Pome", imageData: img.base64())
        client.create(newPost) { post in
            print("Successful!")
            print(post?.title)

        }
    }
}
