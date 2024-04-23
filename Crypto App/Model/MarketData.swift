//
//  MarketData.swift
//  Crypto App
//
//  Created by ahmed shaban on 19.04.2024.
//

import Foundation

/*
 https://api.coingecko.com/api/v3/global
 
 {
 "data": {
 "active_cryptocurrencies": 13976,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 1057,
 "total_market_cap": {
 "btc": 38019153.3823952,
 "eth": 797153096.542334,
 "ltc": 30466372890.75,
 "bch": 5163140110.4644,
 "bnb": 4409886354.67905,
 "eos": 3140819111329.97,
 "xrp": 4936878779168.17,
 "xlm": 21983898406205.5,
 "link": 179350507603.319,
 "dot": 363941680084.098,
 "yfi": 349707863.798967,
 "usd": 2472253660111.25,
 "aed": 9079784211149.1,
 "ars": 2150242657965569,
 "aud": 3857501886437.45,
 "bdt": 271343152283170,
 "bhd": 931970406759.459,
 "bmd": 2472253660111.25,
 "brl": 13030507366348.4,
 "cad": 3403606003455.69,
 "chf": 2246519595167.47,
 "clp": 2394328224744545,
 "cny": 17902330428963.6,
 "czk": 58637656458870.4,
 "dkk": 17317662216376.6,
 "eur": 2320689677224.47,
 "gbp": 1987054101285.14,
 "gel": 6576194735895.94,
 "hkd": 19365286532334.4,
 "huf": 917385034787671,
 "idr": 40215574041313070,
 "ils": 9324141762914.51,
 "inr": 206377310158825,
 "jpy": 382176216352477,
 "krw": 3409300105502414,
 "kwd": 762245248485.5,
 "lkr": 746733617012911,
 "mmk": 5192085939142354,
 "mxn": 42891625672255.9,
 "myr": 11826025383142.2,
 "ngn": 3206512997164297,
 "nok": 27303529866210.1,
 "nzd": 4201832431710.45,
 "php": 142430251628514,
 "pkr": 688076832727470,
 "pln": 10048791449990.7,
 "rub": 230620677027788,
 "sar": 9274219544755.85,
 "sek": 27066794272478.8,
 "sgd": 3367291069442.31,
 "thb": 91169298223922.6,
 "try": 80598497830360.4,
 "twd": 80403869660968.1,
 "uah": 98357289211817.9,
 "vef": 247546758986.94,
 "vnd": 62907221886671080,
 "zar": 47524834228358,
 "xdr": 1877439318503.13,
 "xag": 87748539724.5732,
 "xau": 1039953502.1258,
 "bits": 38019153382395.2,
 "sats": 3801915338239520
 },
 "total_volume": {
 "btc": 2071900.55002263,
 "eth": 43441838.9743284,
 "ltc": 1660302482.66309,
 "bch": 281371674.090686,
 "bnb": 240322183.713529,
 "eos": 171162802570.439,
 "xrp": 269041284404.035,
 "xlm": 1198039597077.14,
 "link": 9773926620.94951,
 "dot": 19833449723.5693,
 "yfi": 19057760.3889472,
 "usd": 134728505568.244,
 "aed": 494814014187.852,
 "ars": 117180119738908,
 "aud": 210219312351.231,
 "bdt": 14787178999117.3,
 "bhd": 50788874201.0722,
 "bmd": 134728505568.244,
 "brl": 710113534298.546,
 "cad": 185483697642.925,
 "chf": 122426849910.325,
 "clp": 130481863072733,
 "cny": 975609527371.329,
 "czk": 3195531248347.8,
 "dkk": 943747313632.483,
 "eur": 126468839805.878,
 "gbp": 108286958522.432,
 "gel": 358377824811.53,
 "hkd": 1055335120541.34,
 "huf": 49994026406680.6,
 "idr": 2191597196750180,
 "ils": 508130579678.218,
 "inr": 11246785485451.1,
 "jpy": 20827163216972.7,
 "krw": 185794004741135,
 "kwd": 41539492836.801,
 "lkr": 40694167391056.4,
 "mmk": 282949112645288,
 "mxn": 2337431923533.1,
 "myr": 644473806385.697,
 "ngn": 174742871722013,
 "nok": 1487939459839.6,
 "nzd": 228984029149.766,
 "php": 7761911837458.93,
 "pkr": 37497593748260.9,
 "pln": 547621256130.842,
 "rub": 12567957596912.8,
 "sar": 505410006965.277,
 "sek": 1475038262331.9,
 "sgd": 183504670624.633,
 "thb": 4968383099840.15,
 "try": 4392314323944.09,
 "twd": 4381707822343.22,
 "uah": 5360101514282.12,
 "vef": 13490365262.5483,
 "vnd": 3.42820647047187e+15,
 "zar": 2589924325433.94,
 "xdr": 102313366042.547,
 "xag": 4781964655.82559,
 "xau": 56673545.867282,
 "bits": 2071900550022.63,
 "sats": 207190055002263
 },
 "market_cap_percentage": {
 "btc": 51.7822256850698,
 "eth": 15.063517605536,
 "usdt": 4.42979899030328,
 "bnb": 3.48686663286745,
 "sol": 2.59563350377611,
 "usdc": 1.34267302385887,
 "steth": 1.17550352137357,
 "xrp": 1.11575413158554,
 "ton": 1.00623340705186,
 "doge": 0.886943373906871
 },
 "market_cap_change_percentage_24h_usd": 3.42869095628729,
 "updated_at": 1713528910
 }
 }
 */

// MARK: - Welcome
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys:String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd "
    }
    
    var marketCap:String{
        if let item = totalMarketCap.first(where: { $0.key == "usd" }){
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var volume: String{
        if let item = totalVolume.first(where: { $0.key == "usd" }){
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    
    var btcDominance: String{
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }){
            return item.value.asNumberStringWithPrecentage()
        }
        return ""
    }
}
