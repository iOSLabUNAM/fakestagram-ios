//
//  CameraViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernández González on 10/19/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    let client = RestClient<CreatePost>(client: Client.fakestagram, basePath: "/api/v1/posts/")

    @IBAction func createPostBtn(_ sender: UIButton) {
        let image = UIImage(named: "ay-papantla-tus")!
        let newPost = CreatePost(title: "Es harina!!! - \(UUID().uuidString)", imageData: image.toBase64())
        
        client.create(newPost) { (post) in
            print("Aqueso")
        }
        
        
    }
    
}
