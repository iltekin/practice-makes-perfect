//
//  Bmi.swift
//  BMI Calculator
//
//  Created by Sezer İltekin on 21.12.2022.
//

import Foundation

struct Bmi {
    var height: Float
    var weight: Float
    
    init(height: Float, weight: Float) {
        self.height = height
        self.weight = weight
    }
    
    func calculate() -> Float {
        return weight / (height * height)
    }
    
    func resultText(result: Float) -> String {
        
        var text = ""
        
        switch result {
        case ..<16:
            text = "Severe Thinness"
        case ..<17:
            text = "Moderate Thinness"
        case ..<18.5:
            text = "Mild Thinness"
        case ..<25:
            text = "Normal"
        case ..<30:
            text = "Overweight"
        case ..<35:
            text = "Obese Class I"
        case ..<40:
            text = "Obese Class II"
        default:
            text = "Obese Class III"
        }
        
        return text
    }
}
