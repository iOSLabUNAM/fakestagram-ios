//
//  PostCollectionViewCell.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernandez D4 on 10/18/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    static let identifier = "PostCell"
    var post: Post? {
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var authorView: AuthorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeBttn: UIButton!
    @IBOutlet weak var commentBttn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reset(){
        self.imageView.image = UIImage(named: "loading")
        self.likeCounter.text = ""
        self.titleLabel.text = ""
    }
    
    func updateView(){
        reset()
        guard let post = self.post else { return }
        self.authorView.author = post.author
        self.titleLabel?.text = post.title
        self.likeCounter.text = post.likesCountText()
        post.load { [unowned self] img in
            self.imageView.image = img
        }
    }

}
