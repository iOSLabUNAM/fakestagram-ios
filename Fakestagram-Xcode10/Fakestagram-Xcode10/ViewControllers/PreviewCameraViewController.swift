//
//  PreviewCameraViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 20/01/20.
//  Copyright © 2020 unam. All rights reserved.
//

import UIKit

class PreviewCameraViewController: UIViewController {

    var image: UIImage?
    let service = CreatePostService()
    
    @IBOutlet weak var previewImage: UIImageView! {
        didSet {
            previewImage.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func accept(_ sender: UIButton) {
        guard let image = image else {return}
        service.call(image: image, title: UUID().uuidString) { postId in
            print("Successful!")
            print(postId ?? -1)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func get() -> PreviewCameraViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "PreviewCameraViewController") as! PreviewCameraViewController
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
