//
//  CircleButtonWithAnimationView.swift
//  Crypto App
//
//  Created by ahmed shaban on 05.04.2024.
//

import SwiftUI

struct CircleButtonWithAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}

#Preview {
    CircleButtonWithAnimationView(animate: .constant(false))
        .foregroundColor(.red)
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
}
