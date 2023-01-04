//
//  Environment.swift
//  Clima
//
//  Created by Sezer İltekin on 5.01.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

public struct Environment {
    enum Keys {
        static let apiKey = "API_KEY"
    }
    
    // Get the BASE_URL
    static let apiKey: String = {
        guard let apiKeyProperty = Bundle.main.object(
            forInfoDictionaryKey: Keys.apiKey
        ) as? String else {
            fatalError("API_KEY not found")
        }
        return apiKeyProperty
    }()
}
