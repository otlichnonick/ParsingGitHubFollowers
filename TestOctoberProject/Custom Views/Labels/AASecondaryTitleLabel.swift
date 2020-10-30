//
//  AASecondaryTitleLabel.swift
//  TestOctoberProject
//
//  Created by Антон on 26.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

class AASecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    func configure() {
        textColor = .secondaryLabel
        minimumScaleFactor = 0.9
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
