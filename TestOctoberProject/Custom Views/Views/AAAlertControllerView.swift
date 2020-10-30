//
//  AAAlertControllerView.swift
//  TestOctoberProject
//
//  Created by Антон on 29.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

class AAAlertControllerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor       = .systemBackground
        layer.cornerRadius    = 16
        layer.borderWidth     = 2
        layer.borderColor     = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
