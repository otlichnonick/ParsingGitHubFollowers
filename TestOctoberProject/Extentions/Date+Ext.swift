//
//  Date+Ext.swift
//  TestOctoberProject
//
//  Created by Антон on 27.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
