//
//  HomeView.swift
//  Crypto App
//
//  Created by ahmed shaban on 04.04.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    HomeView()
        .colorScheme(.dark)
}
