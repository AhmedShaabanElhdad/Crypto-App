//
//  HomeViewModel.swift
//  Crypto App
//
//  Created by ahmed shaban on 08.04.2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins:[CoinModel] = []
    @Published var portfolioCoins:[CoinModel] = []
    @Published var searchText:String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        $searchText
            .combineLatest(dataService.$allCoins)
            .map(filterCoin)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self](returnedCoins) in
                self?.allCoins = returnedCoins
            }.store(in: &cancellables)
    }
    
    private func filterCoin(text:String, coins: [CoinModel]) -> [CoinModel]{
        guard !text.isEmpty else {
            return coins
        }
        let lowerCaseText = text.lowercased()
        return coins.filter{ (coin)-> Bool in
            return coin.name.lowercased().contains(lowerCaseText) ||
            coin.symbol.lowercased().contains(lowerCaseText) ||
            coin.id.lowercased().contains(lowerCaseText)
        }
    }
}
