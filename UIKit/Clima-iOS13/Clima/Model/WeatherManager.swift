//
//  WeatherManager.swift
//  Clima
//
//  Created by Sezer İltekin on 4.01.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(Environment.apiKey)&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
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
                    if let weather = parseJSON(weatherData: safeData) {
                        delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let city = decodedData.name
            let result = WeatherModel(conditionId: id, cityName: city, temperature: temp)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
}
