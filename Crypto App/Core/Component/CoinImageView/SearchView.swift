//
//  SearchView.swift
//  Crypto App
//
//  Created by ahmed shaban on 11.04.2024.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.accent : Color.theme.secondaty)
            
            TextField("Search by name or symbol...",text: $searchText)
                .foregroundColor(Color.theme.accent)
                .autocorrectionDisabled(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                    ,alignment: .trailing)
        }.font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.theme.background)
                    .shadow(color: Color.theme.accent.opacity(0.15), radius: 10,x: 0,y: 0)        )
            .padding()
        
        
    }
}

#Preview {
    SearchView(searchText: .constant(""))
}
