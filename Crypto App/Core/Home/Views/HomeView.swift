//
//  HomeView.swift
//  Crypto App
//
//  Created by ahmed shaban on 04.04.2024.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var showProfile: Bool = false
    @State private var showProfileView: Bool = false
    @EnvironmentObject private var viewmodel: HomeViewModel
    
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showProfileView, content: {
                    ProtofolioView()
                        .environmentObject(viewmodel)
                })
            VStack {
                homeHeader
                HomeStatisticView(showProfile: $showProfile)
                SearchView(searchTextView: $viewmodel.searchText)
                headerTitle
                if !showProfile {
                    showAllCoinsList(false)
                        .transition(.move(edge: .leading))
                }
                else {
                    showAllCoinsList(true)
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showProfile ? "plus" : "info").animation(.none)
                .onTapGesture {
                    if showProfile {
                        showProfileView.toggle()
                    }
                }
                .background(
                    CircleButtonWithAnimationView(animate: $showProfile)
                )
            Spacer()
            Text(showProfile ? "protofolio" : "Live Price").animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showProfile ? 180 : 0)).onTapGesture {
                withAnimation(.spring){
                    showProfile.toggle()
                }
            }
        }
    }
    
    private func showAllCoinsList(_ showHoldingColumn:Bool) -> some View {
        List{
            ForEach(viewmodel.allCoins) { coin in
                CoinRawCell(coinModel: coin,showHoldingColumn: showHoldingColumn)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }.listStyle(.plain)
            
    }
    
    private var headerTitle: some View {
        HStack{
            Text("Coin")
            Spacer()
            if showProfile {
                Text("Holding")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
        }.font(.caption)
            .foregroundColor(Color.theme.accent)
            .padding(.horizontal)
    }
    
    
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }.environmentObject(DeveloperPreview.instance.viewmodel)
}
