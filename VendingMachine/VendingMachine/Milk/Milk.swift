//
//  Milk.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Milk: Beverage {
    private let milkGrade: MilkGrades
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String, _ milkGrades: MilkGrades) {
        self.milkGrade = milkGrades
        super.init(brand, weight, price, name, manufactured_date)
    }
    
    override var expirationDate: Date? {
        guard let manufacturingDate = DateAndTime.formatter.date(from: self.manufactured_date) else {
            return nil
        }
        return Date(timeInterval: DateAndTime.fourtyFiveDaysAsSeconds, since: manufacturingDate)
    }
    
}

enum MilkGrades {
    case first_Grade, second_Grade, third_grade
}

enum Standars: Float {
    case ofLowCalorie = 40.0
    case ofHighConcentration = 1.0
}
