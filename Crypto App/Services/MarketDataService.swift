//
//  MarketDataService.swift
//  Crypto App
//
//  Created by ahmed shaban on 19.04.2024.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription :AnyCancellable?
    
    
    init() {
        getMarketData()
    }
    
    // Mark:-   https://api.coingecko.com/api/v3/global

    private func getMarketData(){
        guard let url = URL(string:
            "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response  = output.response as? HTTPURLResponse ,response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }.receive(on: DispatchQueue.main)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            } receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            }
        
    }
}
