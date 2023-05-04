//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Andrey on 03.05.2023.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "697DF6CF-C54D-48BC-82DB-3168D3FB7854"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = baseURL + currency + "?apikey=" + apiKey
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    self.delegate?.didFailError(self, error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coinRate = self.parseJSON(safeData) {
//                        self.delegate?.didUpdateWeather(self, weather: weather)
                        print(coinRate)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            
            return rate
            
        } catch {
//            delegate?.didFailError(self, error: error)
            return nil
        }
    }
}
