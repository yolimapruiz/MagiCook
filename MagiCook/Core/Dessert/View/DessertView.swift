//
//  DessertView.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import SwiftUI

struct DessertView: View {
    
    @StateObject private var viewModel = DessertViewModel()
    private var result: [Dessert] {
        return  viewModel.dessertList
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                DesertListView(viewModel: viewModel)
                
            }
            .onAppear{
                viewModel.getDessertList()
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    DessertView()
}
