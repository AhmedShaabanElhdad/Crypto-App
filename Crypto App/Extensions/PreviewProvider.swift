//
//  PreviewProvider.swift
//  Crypto App
//
//  Created by ahmed shaban on 07.04.2024.
//

import Foundation
import SwiftUI


extension PreviewProvider {
    static var dev:DeveloperPreview {
        DeveloperPreview.instance
    }
}


class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let viewmodel = HomeViewModel()
    
    let coinModel = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 67776,
        marketCap: 1335122420493,
        marketCapRank: 1,
        fullyDilutedValuation: 1425052604466,
        totalVolume: 28801684702,
        high24H: 68535,
        low24H: 66174,
        priceChange24H: 833.8,
        priceChangePercentage24H: 1.24555,
        marketCapChange24H: 18993564744,
        marketCapChangePercentage24H: 1.44314,
        circulatingSupply: 19674762,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 73738,
        athChangePercentage: -7.95692,
        athDate:"2024-03-14T07:10:36.635Z",
        atl: 67.81,
        atlChangePercentage: 99990.93982,
        atlDate: "2013-07-06T00:00:00.000Z",
        roi: nil,
        lastUpdated: "2024-04-06T11:16:58.264Z",
        sparklineIn7D: SparklineIn7D(
          price: [
            69993.69822343232,
            69965.52751036559,
            69909.62947172619,
            69966.6849975713,
            70054.85964219787,
            70141.46168819138,
            70212.70191019075,
            70290.04906804294,
            70179.01485359542,
            70134.3825664161,
            70041.06744242588,
            70207.92254323962,
            70059.88258540482,
            69887.96590049165,
            69888.20736567445,
            69846.36521695401,
            69762.82560475214,
            69744.13074270339,
          ]
        ),
        priceChangePercentage24HInCurrency: 1.2455547456659033, currentHolding: 0
      )
}
