//
//  CustomBackButton.swift
//  MagiCook
//
//  Created by Yolima Pereira Ruiz on 19/05/24.
//

import SwiftUI

struct MyBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primaryColor)
                }
    }
}
