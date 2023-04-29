//
//  FavoritesScreen.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 29/4/23.
//

import Foundation
import SwiftUI

struct FavoritesScreen: View {

    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, FavoritesScreen!")
                .padding()
            
            Button("toggle is isActive") {
//                isActive.toggle()
            }
        }
    }
}


struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
