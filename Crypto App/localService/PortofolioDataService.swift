//
//  PortofolioDataService.swift
//  Crypto App
//
//  Created by ahmed shaban on 02.05.2024.
//

import Foundation
import CoreData

class PortofolioDataService {
    private let container:NSPersistentContainer
    
    @Published var savedEntities: [CoinPortofolioEntity] = []
    
    init() {
        self.container = NSPersistentContainer(name: "PortofolioContainer")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data \(error)")
            }
            self.getPortofolio()
        }
    }
    
    // MARK Public
    func updatePortofolio(coin: CoinModel, amount:Double){
        if let entity = savedEntities.first(where:  {$0.coinId == coin.id} ){
            if(amount > 0) {
                update(entity: entity, amount: amount)
            } else {
                remove(entity: entity)
            }
        } else {
            addCoin(coin: coin, amount: amount)
        }
    }
    
    // MARK Private
    
    private func getPortofolio() {
        let request = NSFetchRequest<CoinPortofolioEntity>(entityName: "CoinPortofolioEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch (let error){
            print("Error Request CoinPortofolioEntity Data \(error)")
        }
    }
    
    private func addCoin(coin: CoinModel , amount: Double) {
        let entity = CoinPortofolioEntity(context: container.viewContext)
        entity.coinId = coin.id
        entity.amount = amount
        applyChange()
    }
    
    private func update(entity: CoinPortofolioEntity , amount: Double) {
        entity.amount = amount
        applyChange()
    }
    
    private func remove(entity: CoinPortofolioEntity) {
        container.viewContext.delete(entity)
        applyChange()
    }
    
    private func save(){
        do {
            try container.viewContext.save()
        } catch (let error){
            print("Error Saving to Data \(error)")
        }
    }
    
    private func applyChange(){
        save()
        getPortofolio() // to ensure this sync to the last updated
    }
    
}
