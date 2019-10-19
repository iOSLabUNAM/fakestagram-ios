//
//  AuthorView.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 12/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

@IBDesignable
class AuthorView: UIView {
    var author: Author? {
        didSet { updateContent() }
    }

    private let avatar: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "person")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 41
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem ipsum"
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lbl.textColor =  .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    private func setupConstraints() {
        addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            avatar.widthAnchor.constraint(equalToConstant: 90)
            ])
        addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5),
            nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            nameLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }

    func updateContent() {
        guard let uauthor = author else { return }
        nameLbl.text = uauthor.name
    }
}

