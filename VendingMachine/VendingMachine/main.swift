//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let date = Date()
var welchs = Welchs("톡쏘는정훈", 400, 1500, "웰치스", date, 40, .grape)
var choco_Flavored_Milk = Choco_Flavored_Milk("달콤한정훈", 250, 1700, "맛좋은초코유유", date, .second_Grade, 200, 1)
var top = Top("분위기있는정훈", 200, 1500, "TOP", date, .grande, .basic)
var dutchCoffeeStory = DutchCoffeeStory("분위기있는정훈", 300, 3000, "더치커피스토리", date, .short, .forGiftUse)
var beverages: [Printable] = [choco_Flavored_Milk, top, dutchCoffeeStory, welchs]
beverages.forEach {
    OutputView.printBeverage(species: $0)
}

