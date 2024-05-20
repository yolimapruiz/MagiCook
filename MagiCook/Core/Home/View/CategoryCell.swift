//
//  CategoryCell.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import SwiftUI
import Kingfisher


struct CategoryCell: View {
    
    var category: Category
    
    @State var gradient: Gradient = Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)])
    
    var body: some View {
        VStack {
            KFImage(URL(string: category.image))
                .placeholder {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom) {
                    Text(category.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.1))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .frame(maxWidth: 136)
                        .padding()
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
