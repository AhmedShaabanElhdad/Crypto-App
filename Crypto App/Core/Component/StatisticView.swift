//
//  StatisticView.swift
//  Crypto App
//
//  Created by ahmed shaban on 17.04.2024.
//

import SwiftUI

struct StatisticView: View {
    
    let statisticModel:StatisticModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 4){
            Text(statisticModel.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaty)
            Text(statisticModel.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack(spacing: 4){
                Image(systemName: "triangle.fill")
                    .rotationEffect(Angle(degrees: (statisticModel.precentage ?? 0 ) >= 0 ? 0 : 180))
                Text(statisticModel.precentage?.asNumberStringWithPrecentage() ?? "")
                    .font(.caption2)
            }.foregroundColor((statisticModel.precentage ?? 0 ) >= 0 ? Color.theme.green : Color.theme.red)
            
        }
        
    }
}

#Preview {
    Group {
        StatisticView(statisticModel: DeveloperPreview.instance.staticModels)
        
        StatisticView(statisticModel: DeveloperPreview.instance.staticModels2)
    }
}

