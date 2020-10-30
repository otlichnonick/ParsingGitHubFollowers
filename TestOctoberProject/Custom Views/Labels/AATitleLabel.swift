//
//  AATitleLabel.swift
//  TestOctoberProject
//
//  Created by Антон on 19.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

class AATitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    func configure() {
        textColor                           = .label
        minimumScaleFactor                  = 0.9
        adjustsFontSizeToFitWidth           = true
        adjustsFontForContentSizeCategory   = true
        lineBreakMode                       = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
