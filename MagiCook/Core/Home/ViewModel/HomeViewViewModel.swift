//
//  HomeViewViewModel.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import Foundation
import Foundation

class HomeViewModel: ObservableObject {
    
    
    @Published var categoryList: [Category] = []
    private let dataManager = DataManager.shared
    
    func getCategoryList() {
        Task {
            do {
               var  categoryList = try await dataManager.getCategoryList().filter {
                    !$0.id.isEmpty ||
                    !$0.name.isEmpty ||
                    !$0.image.isEmpty
                }
                
                categoryList.sort(by: {$0.name.lowercased() < $1.name.lowercased() })
                
                DispatchQueue.main.async {
                    self.categoryList = categoryList
                }
                
            }
            catch {
                print("Error fetching categories: \(error.localizedDescription)")
            }
        }
    }
}
