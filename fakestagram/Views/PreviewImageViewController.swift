//
//  PreviewImageViewController.swift
//  fakestagram
//
//  Created by Ricardo Hernández González on 09/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PreviewImageViewController: UIViewController {

    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var textForTitle: UITextField!
    var image: UIImage!
    let service = CreatePostService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        previewImage.image = image
    }

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        let text = textForTitle.text!
        service.call(image: image, title: text) { postId in
            print("Successful!")
            print(postId ?? -1)
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
