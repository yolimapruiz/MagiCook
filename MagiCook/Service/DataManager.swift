//
//  DataManager.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import SwiftUI

class DataManager {
    
    private let baseURL = "https://themealdb.com/api/json/v1/1"
    
    static let shared = DataManager()
    
    func getCategoryList() async throws -> [Category] {
        let decodedResponse: CategoriesResponse = try await performRequest(endpoint: "/categories.php")
        return decodedResponse.categories
    }
    
    func getDessertList() async throws -> [Dessert] {
        let decodedResponse: DessertResponse = try await performRequest(endpoint: "/filter.php?c=Dessert")
        return decodedResponse.desserts
    }
    
    func getDessertListSearched(id: String) async throws -> Meal {
        let endPoint = "/lookup.php?i=\(id)"
        let decodedResponse: MealList = try await performRequest(endpoint: endPoint)
        return decodedResponse.meals[0]
    }
    
    private func performRequest<T: Decodable>(endpoint: String) async throws -> T {
            
            let urlString = "\(baseURL)\(endpoint)"
            print("\(urlString)")
            guard let url = URL(string: urlString) else {
                throw DataManagerError.URLError
            }
            
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw DataManagerError.networkError
            }
            
            guard httpResponse.statusCode == 200 else {
                throw DataManagerError.apiError
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return decodedResponse
            } catch {
                throw DataManagerError.decodingError(error)
            }
           
        }
}

