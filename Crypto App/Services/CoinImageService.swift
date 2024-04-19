//
//  CoinImageService.swift
//  Crypto App
//
//  Created by ahmed shaban on 08.04.2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: Data? = nil
    var imageSubscription: AnyCancellable?
    
    init(urlString: String) {
        getCoinImage(url: urlString)
    }
    
    
    private func getCoinImage(url: String){
        guard let url = URL(string: url) else { return }
        imageSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ (output) -> Data in
                guard let  response = output.response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse) }
                print(response)
                print(output.data)
                return output.data
            })
            .subscribe(on: DispatchQueue.main)
            .sink { (compilation) in
                switch compilation {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            } receiveValue: { [weak  self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            }

    }
    
}
