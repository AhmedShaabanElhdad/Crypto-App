//
//  HomeView.swift
//  Crypto App
//
//  Created by ahmed shaban on 04.04.2024.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var showProfile: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                homeHeader
                Spacer(minLength: 0)
                ScrollView{
                    VStack{
                        ForEach(1...10, id: \.self) { _ in
                            CoinRawCell(coinModel: coinModel,showHoldingColumn: true)
                        }
                    }
                }
            }.padding()
            
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showProfile ? "plus" : "info").animation(.none)
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
}

#Preview {
    HomeView()
}
