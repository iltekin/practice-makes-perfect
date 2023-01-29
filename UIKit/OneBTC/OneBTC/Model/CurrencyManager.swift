//
//  Currencies.swift
//  OneBTC
//
//  Created by Sezer İltekin on 29.01.2023.
//

import UIKit

struct CurrencyManager {
    
    var current: String?
    
    let currencies = ["USD", "TRY", "EUR", "GBP", "JPY"]
    
    let images = [
        "USD": "dollarsign.circle.fill",
        "TRY": "turkishlirasign.circle.fill",
        "EUR": "eurosign.circle.fill",
        "GBP": "sterlingsign.circle.fill",
        "JPY": "yensign.circle.fill"
    ]
    
    mutating func setCurrent(index: Int) {
        self.current = currencies[index]
    }
    
    func getImage() -> UIImage {
        if let current {
            return UIImage(systemName: images[current]!)!
        }
        return UIImage(systemName: "questionmark.circle.fill")!
    }
    
    func getPrice() -> Double {
        return 23600.00
    }
    
}
