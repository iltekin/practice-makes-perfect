//
//  Bill.swift
//  SplitBills
//
//  Created by Sezer İltekin on 2.01.2023.
//

import Foundation

struct Bill {
    var billTotal: Float?
    var tipPercent: Float?
    var splitOption: Float?
    
    func calculate() -> Float {
        if let billTotal, let tipPercent, let splitOption {
            return (billTotal + (billTotal * tipPercent / 100)) / splitOption
        } else {
            return 0.0
        }
    }
    
    mutating func setTipPercent(str: String) {
        switch str {
        case "0%":
            tipPercent = 0.00
        case "10%":
            tipPercent = 10.00
        case "20%":
            tipPercent = 20.00
        default:
            tipPercent = 0.0
        }
    }
    
}
