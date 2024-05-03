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
    @State private var quantitytxt = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    SearchView(searchTextView: $viewmodel.searchText)
                    coinLogoList
                    if selectedCoin != nil {
                        portofolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButtom()
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 0){
                        Image(systemName: "checkmark")
                            .opacity(showCheckMark ? 1.0 : 0)
                        
                        Button(action: {
                            saveButtonPressed()
                        }, label: {
                            Text("save".uppercased())
                        }).opacity( (selectedCoin != nil && selectedCoin?.currentHolding != Double(quantitytxt)) ? 1.0 : 0)
                    }.font(.headline)
                }
            })
        }
    }
}

extension ProtofolioView{
    private var coinLogoList: some View {
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
            .frame(height: 120)
            .padding(.leading)
        })
    }
    
    private var portofolioInputSection: some View {
        VStack(spacing: 10){
            HStack{
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? "" ):")
                Spacer()
                Text("\(selectedCoin?.currentPrice.asCurrency6Digit() ?? "" )")
            }
            Divider()
            
            HStack{
                Text("Portofolio Amount:")
                Spacer()
                TextField("Ex: 1.4",text: $quantitytxt)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack{
                Text("Current Value :")
                Spacer()
                Text(getValue().asNumberString())
            }
        }
        .animation(.none)
        .font(.headline)
        .padding()
    }
    
    private func getValue() -> Double{
        if let value = Double(quantitytxt) {
            return value * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private func saveButtonPressed(){
        guard let coin = selectedCoin else { return }
        
        withAnimation(.easeIn){
            removeSelection()
            showCheckMark = true
        }
        
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ){
            withAnimation(.easeOut){
                showCheckMark = false
            }
        }
    }
    
    private func removeSelection(){
        selectedCoin = nil
        viewmodel.searchText = ""
        quantitytxt = ""
    }
}

#Preview {
    ProtofolioView()
        .environmentObject(DeveloperPreview.instance.viewmodel)
}
