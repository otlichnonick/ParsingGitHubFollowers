//
//  UITableView+Ext.swift
//  TestOctoberProject
//
//  Created by Антон on 30.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

extension UITableView {
    func removaExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
