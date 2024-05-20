//
//  DetailedMealView.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 19/05/24.
//

import SwiftUI

struct DetailedMealView: View {
    
  @StateObject var viewModel : DetailedMealViewModel
   var id: String
   private var meal: Meal? {
      return  viewModel.meal
    }
    let gradient: Gradient = Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)])
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50.0) {
                AsyncImage(url: URL(string: meal?.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
            
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                .frame(height: 300)
                .background(
                    LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                )
                
                VStack(spacing: 20) {
                    if let meal = meal {
                        Text(meal.name )
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Loading Recipe...")
                            .font(.body)
                            .padding(.horizontal)
                    }
                    
                    Text("Ingredients & Measurements")
                        .font(.title2)
                        .bold()
                       // .padding(.top)
                    
                    if let meal = meal {
                        ForEach(Array(zip(meal.ingredients, meal.measurements)), id: \.0) { ingredient, measurement in
                            HStack {
                                Text(ingredient)
                                    .font(.body)
                                Spacer()
                                Text(measurement)
                                    .font(.body)
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        Text("Loading ingredients...")
                            .font(.body)
                            .padding(.horizontal)
                    }
                    
                    Text("Instructions")
                        .font(.title2)
                        .bold()
                       // .padding(.top)
                    
                    if let meal = meal {
                        Text(meal.instructions )
                            .font(.headline)
                            .padding()
                    }
                }
            }
            
            
        }
        .ignoresSafeArea(.container, edges: .top)
        .onAppear{
            viewModel.getMeal(id: id)
        }
    }
}

