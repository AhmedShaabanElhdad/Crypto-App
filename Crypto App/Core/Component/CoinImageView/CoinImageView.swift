//
//  CoinImageView.swift
//  Crypto App
//
//  Created by ahmed shaban on 08.04.2024.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject private var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin:coin ))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                
            } else if vm.loading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaty)
            }
        }.background(Color.theme.accent)
            .clipShape(Circle())
    }
}


#Preview {
    CoinImageView(coin: DeveloperPreview.instance.coinModel)
}
