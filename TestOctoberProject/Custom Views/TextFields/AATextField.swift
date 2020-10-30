//
//  AATextField.swift
//  TestOctoberProject
//
//  Created by Антон on 16.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

class AATextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius          = 12
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        textColor                   = .label
        textAlignment               = .center
        tintColor                   = .label
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        returnKeyType               = .go
        clearButtonMode             = .whileEditing
    }
}
