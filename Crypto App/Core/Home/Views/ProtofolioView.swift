//
//  ProtofolioView.swift
//  Crypto App
//
//  Created by ahmed shaban on 02.05.2024.
//

import SwiftUI

struct ProtofolioView: View {
    
    @EnvironmentObject var viewmodel: HomeViewModel
    @State var selectedCoin:CoinModel? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    SearchView(searchTextView: $viewmodel.searchText)
                    Spacer(minLength: 10)
                    ScrollView(.horizontal, showsIndicators: false,content: {
                        LazyHStack(spacing: 10){
                            ForEach(viewmodel.allCoins) { coin in
                                CoinHorizontalView(coinModel: coin)
                                    .onTapGesture {
                                        withAnimation(.easeIn){
                                            selectedCoin = coin
                                        }
                                    }
                                    .frame(width: 75)
                                    .padding(4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear ,lineWidth: 1)
                                    )
                            }
                        }
                        .padding(.vertical,4)
                        .padding(.leading)
                    })
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButtom()
                }
            })
        }
    }
}

#Preview {
    ProtofolioView()
        .environmentObject(DeveloperPreview.instance.viewmodel)
}
