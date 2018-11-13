//
//  Model.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/13/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import Foundation

class Model {
    
    init() {
        
    }
    
    
}

extension Model {
    
    func getDay(index: Int) -> String {
        return "Sat"
    }
    
    func getDate(index: Int) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.date(from: "12")!
    }
}
