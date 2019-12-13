//
//  CommentsCollectionViewCell.swift
//  fakestagram
//
//  Created by Pedro Antonio Vazquez Rodriguez on 10/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class CommentsCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "CommentCell"
    
    @IBOutlet weak var commentsTextView: UITextView!
    var post: Post? 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
   
}
