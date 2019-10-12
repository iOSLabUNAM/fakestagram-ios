//
//  PostXIBViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernandez D4 on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class PostXIBViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeBttn: UIButton!
    @IBOutlet weak var commentBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTapLike(_ sender: Any){
        print("Like")
    }
    
    @IBAction func onTapCreateComment(_ sender: Any){
        print("Comment")
    }
    
    @IBAction func onTapShowComments(_ sender: Any){
        print("Show comment")
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
