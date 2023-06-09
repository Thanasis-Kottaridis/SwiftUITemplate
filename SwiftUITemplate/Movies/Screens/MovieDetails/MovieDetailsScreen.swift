//
//  MovieDetailsScreen.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 29/4/23.
//

import SwiftUI

struct MovieDetailsScreen: View {

    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.summary ?? "unkonown")
                .padding()
            
            
            Spacer()
        }
    }
}


struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen(
            movie: Movie(
                id: 1,
                url: "url_1",
                name: "show_1",
                type: "type_1",
                language: "language_1",
                genres: ["a","b","c"],
                image: nil,
                summary: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem."
            )
        )
    }
}
