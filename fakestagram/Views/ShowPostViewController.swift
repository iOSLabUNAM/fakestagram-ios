//
//  PostViewController.swift
//  fakestagram
//
//  Created by LuisE on 10/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class ShowPostViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeBttn: UIButton!
    @IBOutlet weak var commentBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction
    func onTapLike(_ sender: Any) {
        print("like")
    }

    @IBAction
    func onTapCreateComment(_ sender: Any) {
        print("to comment")
    }

    @IBAction
    func onTapShowComments(_ sender: Any) {
        print("to show comment")
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
