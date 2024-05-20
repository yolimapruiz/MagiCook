//
//  DessertViewModel.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import Foundation


class DessertViewModel: ObservableObject {
    
    
    @Published var dessertList: [Dessert] = []
    private var originalDessertList: [Dessert] = []
    
    private let dataManager = DataManager.shared
    
    func getDessertList() {
        Task {
            do {
                var  dessertList = try await dataManager.getDessertList().filter {
                    !$0.name.isEmpty ||
                    !$0.id.isEmpty ||
                    !$0.image.isEmpty
                }
                
                dessertList.sort(by: {$0.name.lowercased() < $1.name.lowercased() })
                
                DispatchQueue.main.async {
                    self.dessertList = dessertList
                    self.originalDessertList = dessertList
                }
                
            }
            catch {
                print("Error fetching desserts: \(error.localizedDescription)")
            }
        }
    }
}

extension DessertViewModel{
    func searchMeal(meal: String) {

        if meal.isEmpty {
            dessertList = originalDessertList
        }else {
            dessertList = originalDessertList.filter{ $0.name.lowercased().contains(meal.lowercased()) || $0.id.contains(meal) }
        }
    }
}
