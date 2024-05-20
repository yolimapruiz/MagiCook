//
//  CategoryModel.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import Foundation


struct CategoriesResponse: Codable {
    let categories: [Category]
}

struct Category: Codable, Hashable {
    let id: String
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case image = "strCategoryThumb"
    }
}

