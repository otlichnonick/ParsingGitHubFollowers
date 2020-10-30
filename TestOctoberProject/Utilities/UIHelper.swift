//
//  UIHelper.swift
//  TestOctoberProject
//
//  Created by Антон on 22.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let avalibleWidth               = width - padding * 2 - minimumItemSpacing * 2
        let itemWidth                   = avalibleWidth / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 35)
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        return flowLayout
    }
}
