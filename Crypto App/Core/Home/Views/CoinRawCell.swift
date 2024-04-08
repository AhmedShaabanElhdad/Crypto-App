//
//  CoinRawCell.swift
//  Crypto App
//
//  Created by ahmed shaban on 06.04.2024.
//

import SwiftUI

struct CoinRawCell: View {
    
    var coinModel:CoinModel
    @State var showHoldingColumn: Bool
    
    var body: some View {
        
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingColumn {
                centerColumn
            }
            rightColum
        }
            
    }
}

extension CoinRawCell {
    private var leftColumn: some View {
        HStack(spacing: 0){
            
            Text("\(coinModel.currentRank)")
                .foregroundColor(Color.theme.accent)
                .font(.caption)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30,height: 30)
            
            Text(coinModel.symbol.uppercased())
                .foregroundColor(Color.theme.accent)
                .font(.headline)
                .padding(.leading,6)
                .frame(minWidth: 30)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing){
            Text(coinModel.currentHoldingValue.asCurrency6Digit())
                .bold()
            
            Text(coinModel.currentHolding?.asNumberString() ?? "")
        }.foregroundColor(Color.theme.accent)
        
    }
    
    private var rightColum: some View {
        VStack(alignment: .trailing){
            Text(coinModel.currentPrice.asCurrency6Digit())
                .bold()
                .foregroundColor(Color.theme.accent)
            
            Text(coinModel.priceChangePercentage24H?.asNumberStringWithPrecentage() ?? "")
                .foregroundColor(
                    (coinModel.priceChangePercentage24H ?? 0) >= 0
                    ? Color.theme.green : Color.theme.red )
        }.frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
    }
}

#Preview {
    CoinRawCell(coinModel: DeveloperPreview.instance.coinModel,showHoldingColumn: true)
}
