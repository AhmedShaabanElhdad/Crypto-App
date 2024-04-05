//
//  CircleButtonView.swift
//  Crypto App
//
//  Created by ahmed shaban on 05.04.2024.
//

import SwiftUI



struct CircleButtonView: View {
    let iconName:String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50,height: 50)
            .background(Circle().foregroundColor(Color.theme.background))
            .shadow(color: Color.theme.accent.opacity(0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0,y: 0)
            .padding()

            
    }
}

#Preview {
    Group{
        CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
        
        CircleButtonView(iconName:"heart")
            .previewLayout(.sizeThatFits)
            .colorScheme(.dark)
    }
    
}
