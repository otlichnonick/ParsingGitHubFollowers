//
//  AAImageView.swift
//  TestOctoberProject
//
//  Created by Антон on 20.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

class AAImageView: UIImageView {
    let placeholderImage = Images.placeholderImage

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
