//
//  HomeView.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 18/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    private var result: [Category] {
        return  viewModel.categoryList
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                CategoryList(result: result)
                
            }
            .onAppear{
                viewModel.getCategoryList()
            }
           .navigationTitle("Categories")
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}

