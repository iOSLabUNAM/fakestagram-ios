//
//  PostCollectionViewCell.swift
//  fakestagram
//
//  Created by LuisE on 10/18/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    let service = CreateLikeService()

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
    @IBOutlet weak var commentBttn: UIButton!

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
        self.likeCounter.text = post.likesCountText()
        post.load { [unowned self] img in
            self.imageView.image = img
        }
    }
    
    @IBAction func likeButton(_ sender: Any) {
        guard var post = self.post else { return }
        guard let postId = post.id else {return}
        print("Se presiono like en post: \(postId)")
        service.call(postId: String(postId)){ creationDate in
            print("Liked Successfully! \(creationDate ?? "")")
        }
        post.likesCount += 1
        self.likeCounter.text = post.likesCountText()
    }
    
    

}
