//
//  Cards.swift
//  CardWorkout
//
//  Created by Sezer İltekin on 18.10.2022.
//

import UIKit

struct Cards {
    var allCards: [UIImage] = []
    
    private var keys = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "K", "J", "Q"]
    private var types = ["C", "D", "H", "S"]
    
    init() {
        for type in types {
            for key in keys {
                let element = UIImage(named: key + type)!
                allCards.append(element)
            }
        }
    }
}
