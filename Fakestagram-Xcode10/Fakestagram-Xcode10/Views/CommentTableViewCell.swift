 //
//  CommentTableViewCell.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 17/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    static let identifier: String = "commentCell"
    @IBOutlet weak var userImage : UIImageView!
    @IBOutlet weak var userName : UILabel!
    @IBOutlet weak var userComment : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
