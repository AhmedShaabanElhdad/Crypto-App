//
//  CoinImageViewModel.swift
//  Crypto App
//
//  Created by ahmed shaban on 08.04.2024.
//

import SwiftUI
import Combine



class CoinImageViewModel : ObservableObject{
    @Published var image: UIImage? = nil
    @Published var loading: Bool = false
    
    private let dataService: CoinImageService
    private let coin: CoinModel
    private var cancellables = Set<AnyCancellable>()
    
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(urlString: coin.image)
        self.loading = true
        getImage()
    }
    
    func getImage(){
        dataService.$image
            .sink { [weak self] (_) in
                self?.loading = false
            } receiveValue: { [weak self] (returnedImageData) in
                guard let image = returnedImageData else { return }
                self?.image = UIImage(data: image)
            }.store(in: &cancellables)
    

    }
}
