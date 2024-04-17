//
//  HomeStatisticView.swift
//  Crypto App
//
//  Created by ahmed shaban on 17.04.2024.
//

import SwiftUI

struct HomeStatisticView: View {
    
    @EnvironmentObject private var viewmodel:HomeViewModel
    
    @Binding var showProfile: Bool
    
    var body: some View {
        HStack{
            ForEach(viewmodel.statisticsArray) { statisticModel in
                StatisticView(statisticModel: statisticModel)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }.frame(width: UIScreen.main.bounds.width,alignment: showProfile ? .trailing : .leading)
    }
}

#Preview {
    HomeStatisticView(showProfile: .constant(true))
        .environmentObject(DeveloperPreview.instance.viewmodel)
}
