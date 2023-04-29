//
//  MovieDetailsScreen.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 29/4/23.
//

import Foundation
import SwiftUI

struct MovieDetailsScreen: View {

    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, MovieDetailsScreen!")
                .padding()
            
            Button("toggle is isActive") {
//                isActive.toggle()
            }
        }
    }
}


struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen()
    }
}
