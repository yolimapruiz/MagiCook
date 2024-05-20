//
//  DessertModel.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import Foundation
import Foundation


struct DessertResponse: Codable {
    let desserts: [Dessert]
    
    enum CodingKeys: String, CodingKey {
        case desserts = "meals"
    }
    
    
}


struct Dessert: Codable{
    let id: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case image = "strMealThumb"
    }
}
