//
//  XMarkButtom.swift
//  Crypto App
//
//  Created by ahmed shaban on 02.05.2024.
//

import SwiftUI

struct XMarkButtom: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    XMarkButtom()
}
