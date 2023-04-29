//
//  MovieItem.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 30/4/23.
//

import SwiftUI

struct MovieItem: View {
    
    let movie: Movie
    let handler: (Movie) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(movie.name ?? "unknown")
        
            Text(movie.summary ?? "unknown")
                .lineLimit(4)
            
        }
        .padding(.all, 16)
        .onTapGesture { handler(movie) }
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var previews: some View {
        
        MovieItem(
            movie: Movie(
                id: 1,
                url: "url_1",
                name: "show_1",
                type: "type_1",
                language: "language_1",
                genres: ["a","b","c"],
                image: nil,
                summary: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem."
            )) { movie in }
    }
}
