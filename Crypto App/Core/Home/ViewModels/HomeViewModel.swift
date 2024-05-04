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
    @Published var marketData:MarketDataModel? = nil
    @Published var searchText:String = ""
    @Published var statisticsArray:[StatisticModel]  =  []
    
    private let coinDataService = CoinDataService()
    private let portofolioDataService = PortofolioDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .map(filterCoin)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self](returnedCoins) in
                self?.allCoins = returnedCoins
            }.store(in: &cancellables)
        
                
        marketDataService.$marketData
            .map(mapGlobalMarketData).sink {[weak self] (returnedStatistics) in
                self?.statisticsArray = returnedStatistics
            }.store(in: &cancellables)
        
        $allCoins
            .combineLatest(portofolioDataService.$savedEntities)
            .map { (coinModels, coinPortofolioEntities) ->[CoinModel] in
                coinModels.compactMap { coin -> CoinModel? in
                    guard let entity = coinPortofolioEntities.first (where:  {$0.coinId == coin.id } ) else {
                        return nil
                    }
                    return coin.updateAmount(amount: entity.amount)
                }
            }.sink { [weak self](returnedCoins) in
                self?.portfolioCoins = returnedCoins
            }.store(in: &cancellables)
    }
    
    func updateProfileCoin(coinModel:CoinModel, amount: Double){
        portofolioDataService.updatePortofolio(coin: coinModel, amount: amount)
    }
    
    private func mapGlobalMarketData(marketDataModel:MarketDataModel?) -> [StatisticModel] {
        var statstics: [StatisticModel] = []

        guard let data = marketDataModel else { return statstics }
        let marketcap = StatisticModel(title: "Market Cao", value: data.marketCap, precentage: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", precentage: 0)
        
        statstics.append(contentsOf: [
            marketcap,
            volume,
            btcDominance,
            portfolio
        ])
        return statstics
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
