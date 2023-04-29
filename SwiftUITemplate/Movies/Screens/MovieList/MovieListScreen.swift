//
//  ContentView.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 4/4/23.
//

import SwiftUI

/**
    # Navigation Action
    Each navigation action navigates to a view with specific transition style
 */
protocol Action {

    associatedtype V: View
    var transition: NavigationStyle { get }
    
    /// Creates and returns a view of assosiated type
    ///
    @ViewBuilder
    func view() -> V
}

struct GoToMovieListAction: Action {
    typealias V = MovieListScreen
    var transition: NavigationStyle = .push
    
    func view() -> MovieListScreen {
        return MovieListScreen()
    }
}
struct GoToDetailsAction: Action {
    typealias V = MovieDetailsScreen
    var transition: NavigationStyle = .push
    var isActive: Bool
    
    @ViewBuilder
    func view() -> V {
        MovieDetailsScreen(isActive: isActive)
    }
}
struct GoToFavoritesAction: Action {
    typealias V = FavoriteMoviesScreen
    var transition: NavigationStyle = .push
    var isActive: Bool
    
    func view() -> V {
        return FavoriteMoviesScreen(isActive: isActive)
    }
}



//class TestCoordinator: Coordinator, ObservableObject {
//    @Published var navigationStack = [any Action]()
//    weak var parentCoordinator: (any Coordinator)?
//
//    init(parentCoordinator: Coordinator) {
//        self.parentCoordinator = parentCoordinator
//    }
//
//}
//
//struct NavigationController: View {
//    @State private var selection: String? = nil
//
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(
//                    tag: GoToMovieListAction.self,
//                    selection: $selection,
//                    destination: <#T##() -> Destination#>, label: <#T##() -> Label#>)
//            }
//        }
//    }
//}

struct MovieListScreen: View {
    
    @State private var isShowingDetails = false
    
    var body: some View {
                        
        NavigationView {
            VStack (spacing: 30) {
                NavigationLink(
                    "Go to the Details",
                    isActive: $isShowingDetails
                ) {
                    MovieDetailsScreen(isActive: isShowingDetails)
                }
                
                Button("toggle is isShowingDetails") {
                    isShowingDetails.toggle()
                }
            }//.navigationTitle("Landing Page")
        }.navigationViewStyle(.stack)
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}


struct MovieDetailsScreen: View {

    var isActive: Bool

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

struct FavoriteMoviesScreen: View {

    var isActive: Bool

    var body: some View {
        VStack{
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, FavoriteMoviesScreen!")
                .padding()
        }
    }
    
}
