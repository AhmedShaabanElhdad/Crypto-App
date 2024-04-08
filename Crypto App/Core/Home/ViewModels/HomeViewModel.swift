//
//  HomeViewModel.swift
//  Crypto App
//
//  Created by ahmed shaban on 08.04.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins:[CoinModel] = []
    @Published var portfolioCoins:[CoinModel] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coinModel)
            self.allCoins.append(DeveloperPreview.instance.coinModel)
            self.allCoins.append(DeveloperPreview.instance.coinModel)
            self.allCoins.append(DeveloperPreview.instance.coinModel)
            self.allCoins.append(DeveloperPreview.instance.coinModel)
            
            self.portfolioCoins.append(DeveloperPreview.instance.coinModel)
            self.portfolioCoins.append(DeveloperPreview.instance.coinModel)
        }
    }
    
}
