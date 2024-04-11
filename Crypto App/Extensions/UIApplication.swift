//
//  UIApplication.swift
//  Crypto App
//
//  Created by ahmed shaban on 11.04.2024.
//

import Foundation
import SwiftUI


extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
