//
//  WeatherManager.swift
//  Clima
//
//  Created by Sezer İltekin on 4.01.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(Environment.apiKey)&units=metric"
    
    func fetch(cityName: String) {
        if let encodedCity = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            let urlString = "\(weatherURL)&q=\(encodedCity)"
            performRequest(urlString: urlString)
        }
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].main)
        } catch {
            print(error)
        }
        
    }
    
}
