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
            updateContent()
        }
    }
    
    @IBOutlet weak var authorView: UIView!
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
        self.imageView.image = nil
        self.likeCounter.text = "Likes"
        self.titleLabel.text = "Loading..."
    }
    
    func updateContent(){
        reset()
        guard let post = self.post else { return }
        
        self.titleLabel?.text = "hola"
        self.likeCounter.text = String(post.likesCount)
        post.load { [unowned self ]img in
            self.imageView.image = img
        }
    }

}
