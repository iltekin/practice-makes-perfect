//
//  CommaToDot.swift
//  SplitBills
//
//  Created by Sezer İltekin on 3.01.2023.
//

import Foundation

extension String {
    func commaToDot() -> String {
        return self.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
    }
}
