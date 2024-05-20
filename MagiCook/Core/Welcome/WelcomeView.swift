//
//  WelcomeView.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 19/05/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var presentCategories = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image(uiImage: Images.Welcome.background)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Text("Welcome to\n Magic Cook")
                        .font(.system(size: 48, weight: .semibold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black)
                        .opacity(0.8)
                        .shadow(radius: 10)
                        .padding(.bottom, 8)
                    
                    Text("Discover delicious recipes in just a few seconds and start making magic")
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.bottom, 40)
                        .frame(width: 300)
                        
                    Spacer()
                    Spacer()
                    
                    Button{
                        presentCategories.toggle()
                    } label: {
                        Text("Get Started")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 360, height: 44)
                            .background(Color.primaryColor)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 90)
                    
            }
        }
            .navigationDestination(isPresented: $presentCategories) {
                TabBar()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
