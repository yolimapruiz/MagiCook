//
//  CategoryNavigation.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import Foundation
import SwiftUI


enum Categories: String {
    case Beef = "Beef"
    case Chicken = "Chicken"
    case Dessert = "Dessert"
    case Lamb = "Lamb"
    case Miscellaneous = "Miscellaneous"
    case Pasta = "Pasta"
    case Pork = "Pork"
    case Seafood = "Seafood"
    case Side = "Side"
    case Starter = "Starter"
    case Vegan = "Vegan"
    case Vegetarian = "Vegetarian"
    case Breakfast = "Breakfast"
    case Goat = "Goat"
    
    static func category(for id: String) -> AnyView {
        switch id {
        case "1": return AnyView(Text(Categories.Beef.rawValue))
        case "2": return AnyView(Text(Categories.Chicken.rawValue))
        case "3": return AnyView(DessertView()
            .navigationSplitViewStyle(.balanced)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: MyBackButton())
            .navigationTitle("Desserts")
           
        )
        case "4": return AnyView(Text(Categories.Lamb.rawValue))
        case "5": return AnyView(Text(Categories.Miscellaneous.rawValue))
        case "6": return AnyView(Text(Categories.Pasta.rawValue))
        case "7": return AnyView(Text(Categories.Pork.rawValue))
        case "8": return AnyView(Text(Categories.Seafood.rawValue))
        case "9": return AnyView(Text(Categories.Side.rawValue))
        case "10": return AnyView(Text(Categories.Starter.rawValue))
        case "11": return AnyView(Text(Categories.Vegan.rawValue))
        case "12": return AnyView(Text(Categories.Vegetarian.rawValue))
        case "13": return AnyView(Text(Categories.Breakfast.rawValue))
        case "14": return AnyView(Text(Categories.Goat.rawValue))
        default: return  AnyView(Text(""))
        }
    }
}
