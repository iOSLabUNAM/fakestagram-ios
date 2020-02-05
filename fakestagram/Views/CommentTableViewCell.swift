//
//  CommentTableViewCell.swift
//  fakestagram
//
//  Created by Ma. de Lourdes Chaparro Candiani on 05/02/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
