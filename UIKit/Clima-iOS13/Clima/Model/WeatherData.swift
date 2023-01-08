//
//  WeatherData.swift
//  Clima
//
//  Created by Sezer İltekin on 4.01.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
