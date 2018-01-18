//
//  InventoryBox.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InventoryBox {
    enum VendingMachinError: Error {
        case invalidBeverage
    }
    private var box: [ObjectIdentifier:[Beverage]]
    init() {
        box = [ObjectIdentifier:[Beverage]]()
    }
    
    func storageBeverageStock(beverage: Beverage) {
        let classOfBeverage = ObjectIdentifier(type(of: beverage))
        if !box.keys.contains(classOfBeverage) {
            box[classOfBeverage] = [Beverage]()
        }
        box[classOfBeverage]?.append(beverage)
    }
    
    func priceLessThan(coins: Int) -> [ObjectIdentifier:[Beverage]] {
        var drinkOfAvailable = [ObjectIdentifier:[Beverage]]()
        for typeOfBeverage in box {
            if typeOfBeverage.value[0].price <= coins {
                drinkOfAvailable[typeOfBeverage.key] = [Beverage]()
                drinkOfAvailable[typeOfBeverage.key] = typeOfBeverage.value
            }
        }
        return drinkOfAvailable
    }
    
    func sellDrink(beverageKey: ObjectIdentifier) throws -> Beverage {
        guard let beverageOfChoice = box[beverageKey]?.remove(at: 0) else {
            throw VendingMachinError.invalidBeverage
        }
        if box[beverageKey]?.count == 0 {
            box.remove(at: box.index(forKey: beverageKey)!)
        }
        return beverageOfChoice
    }
    
    func overallProductInventory() -> [ObjectIdentifier:[Beverage]] {
        return box
    }
    
    func outOfStockInventory() -> [Beverage] {
        var drinkOfOutOfStock = [Beverage]()
        for beverageType in box {
            for beverage in beverageType.value {
                if ((beverage as? Milk)?.isOverExpirationDate()) ?? false {
                    drinkOfOutOfStock.append(beverage)
                }
            }
        }
        return drinkOfOutOfStock
    }
    
    func hotDrinkInventory() -> [Beverage] {
        var hotDrink = [Beverage]()
        for beverageType in box {
            for beverage in beverageType.value {
                if ((beverage as? Top)?.isColdDrink()) ?? false {
                    hotDrink.append(beverage)
                }
            }
        }
        return hotDrink
    }
    
}


