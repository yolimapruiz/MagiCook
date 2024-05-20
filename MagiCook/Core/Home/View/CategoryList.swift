//
//  CategoryList.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import Foundation
import SwiftUI

struct CategoryList: View {
    
     var result: [Category]
    
    var body: some View {
        
        VStack{
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(result, id: \.id) { category in
                    
                    NavigationLink {
                        Categories.category(for: category.id)
                    } label: {
                        CategoryCell(category: category)
                    }
                    
                }
            }
            .padding(.top)
            
        }
    }
}


