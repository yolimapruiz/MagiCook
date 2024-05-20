//
//  DessertListView.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 19/05/24.
//

import SwiftUI

import SwiftUI

struct DesertListView: View {
    
    @ObservedObject var viewModel: DessertViewModel
    @StateObject var detailMealViewModel =  DetailedMealViewModel()
    var result: [Dessert] {
        viewModel.dessertList
    }
    @State private var searchDesert = ""
   
   var body: some View {
       
       VStack{
           
           LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
               ForEach(result, id: \.id) { dessert in
                   
                   NavigationLink {
                       DetailedMealView(viewModel: detailMealViewModel, id: dessert.id)
                           .navigationBarBackButtonHidden(true)
                           .navigationBarItems(leading: MyBackButton())
                       
                   } label: {
                       DesertCardView(dessert: dessert)
                   }
               }
           }
           .searchable(text: $searchDesert)
           
       }
      .onChange(of: searchDesert) { oldValue, newValue in
         viewModel.searchMeal(meal: newValue)
          print(newValue)
      }
       .padding(.horizontal)
       
       
   }
    

}
