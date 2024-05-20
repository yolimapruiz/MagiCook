//
//  TabBar.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 19/05/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            
       HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                        
                }
                    
            FavoritesView()
                .tabItem {
                   Label("Favorites", systemImage: "heart")
                }
                    
            SettingsView()
                .tabItem {
                  Label("Settings", systemImage: "gear")
                    }
                }
        .accentColor(.primaryColor)
        }
    }

#Preview {
    TabBar()
}
