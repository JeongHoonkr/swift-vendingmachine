//
//  InputView.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 13..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    
    static func read() -> Int? {
        let menu: String = "1. 관리자모드\n2. 사용자모드"
        print(menu)
        return Int(readLine() ?? "Error")
        
    }
    static func readMenu() -> (menuOption: Action, detail: Int)? {
        var realMenu = [Int]()
        if let menu = readLine() {
            guard menu != "q" else { return nil }
            if menu == "3" {
                return (menuOption: .exit, -1)
            }
            let tempMenu = menu.split(separator: " ").flatMap{ Int($0) }
            realMenu = tempMenu
        }
        if realMenu.count != 2 { return nil }
        guard let menuOption = Action(rawValue: realMenu[0]) else { return nil }
        return (menuOption, realMenu[1])
    }
}
