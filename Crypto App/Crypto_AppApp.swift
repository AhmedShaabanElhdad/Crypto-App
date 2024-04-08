//
//  Crypto_AppApp.swift
//  Crypto App
//
//  Created by ahmed shaban on 04.04.2024.
//

import SwiftUI


@main
struct Crypto_AppApp: App {
    @StateObject private var viewModel = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
