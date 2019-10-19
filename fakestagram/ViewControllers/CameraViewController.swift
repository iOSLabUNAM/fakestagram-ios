//
//  CameraViewController.swift
//  fakestagram
//
//  Created by LuisE on 10/19/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    let client = RestClient<CreatePost>(client: Client.fakestagram, basePath: "/api/v1/posts/")
    @IBAction func onTapCreate(_ sender: Any) {
        let img = UIImage(named: "spacecat")!
        let newPost = CreatePost(title: "Spacecat🙀 - \(UUID().uuidString)", imageData: img.base64())
        client.create(newPost) { post in
            print("Successful!")
            print(post?.title)
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
