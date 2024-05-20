//
//  DetailedMealViewModel.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 19/05/24.
//

import Foundation

class DetailedMealViewModel: ObservableObject {
    
    
    @Published var meal: Meal? = nil
    private let dataManager = DataManager.shared
    
    func getMeal(id: String) {
        Task {
            do {
                let  meal = try await dataManager.getDessertListSearched(id: id)
                print("esta es la meal: \(meal)")
                DispatchQueue.main.async {
                    self.meal = meal
                }
                
            }
            catch {
                print("Error fetching categories: \(error.localizedDescription)")
            }
        }
    }
    
    func hi(){
        Task {
            print("hello")
        }
       
    }
}
