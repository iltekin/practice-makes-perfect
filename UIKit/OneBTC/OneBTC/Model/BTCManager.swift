//
//  BTCManager.swift
//  OneBTC
//
//  Created by Sezer İltekin on 29.01.2023.
//

import UIKit

struct BTCManager {
    let BTCurl = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let BTCkeyPrefix = "?apikey=C8D9969A-A1AC-43F4-BD7E-4B258C062979"

    var delegate: BTCManagerDelegate?
    
    func fetch(currency: String) {
        let mergedString = "\(BTCurl)\(currency)\(BTCkeyPrefix)"
        performRequest(urlString: mergedString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let btc = parseJSON(data: safeData){
                        delegate?.updatePrice(price: btc.rate)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> BTCModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(BTCData.self, from: data)
            let rate = decodedData.rate
            let result = BTCModel(rate: rate)
            return result
        } catch {
            print(error)
            return nil
        }
        
    }
    
}
