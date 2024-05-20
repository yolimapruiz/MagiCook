//
//  DessertCartView.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 19/05/24.
//

import SwiftUI

struct DesertCardView: View {
    var dessert: Dessert
    
    @State var gradient: Gradient = Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)])
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dessert.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(dessert.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        Text(dessert.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: 136)
                            .padding()
                    }
        }
            
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(
            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 10)
        
    }
}


