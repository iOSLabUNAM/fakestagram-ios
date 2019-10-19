//
//  PostCollectionViewCell.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 18/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "PostCell"
    public var post: Post? {
        didSet {
            updateView()
        }
    }

    @IBOutlet weak var authorView: AuthorView!
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

    func reset() {
        self.imageView.image = nil
        self.likeCounter.text = ""
        self.titleLabel.text = ""
    }

    func updateView() {
        reset()
        guard let post = self.post else { return }
        self.authorView.author = post.author
        self.titleLabel.text = post.title
        self.titleLabel.textColor = .black
        self.likeCounter.text = post.likesCountText()
        post.load { [unowned self] img in
            self.imageView.image = img
        }
    }
}
