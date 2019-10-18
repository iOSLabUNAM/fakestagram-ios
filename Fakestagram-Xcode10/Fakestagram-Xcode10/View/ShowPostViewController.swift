//
//  PostViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 12/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ShowPostViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeBttn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    
    @IBAction func onTapLike(_ sender: Any?){
        print("Likes")
    }
    @IBAction func onTapCreateComment(_ sender: Any?){
        print("to comment")
    }
    @IBAction func onTapShowComment(_ sender: Any?){
        print("to show comment")
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
