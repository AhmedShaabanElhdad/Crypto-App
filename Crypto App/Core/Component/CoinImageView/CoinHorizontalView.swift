//
//  CoinHorizontalView.swift
//  Crypto App
//
//  Created by ahmed shaban on 02.05.2024.
//

import SwiftUI

struct CoinHorizontalView: View {
    
    let coinModel: CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coinModel)
                .frame(width: 50,height: 50)
                
            Text(coinModel.symbol.uppercased())
                .lineLimit(1)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .minimumScaleFactor(0.5)
            
            Text(coinModel.name)
                .lineLimit(2)
                .font(.caption)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.theme.secondaty)
        }
        
    }
}

#Preview {
    CoinHorizontalView(coinModel: DeveloperPreview.instance.coinModel)
}
