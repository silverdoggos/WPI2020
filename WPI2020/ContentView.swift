//
//  ContentView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 01.03.2021.
//

import SwiftUI

// MARK: - NavigationIndicator
struct NavigationIndicator: UIViewControllerRepresentable {
   typealias UIViewControllerType = ARView
   func makeUIViewController(context: Context) -> ARView {
      return ARView()
   }
   func updateUIViewController(_ uiViewController:
   NavigationIndicator.UIViewControllerType, context:
   UIViewControllerRepresentableContext<NavigationIndicator>) { }
}

struct ContentView: View {
    var body: some View {
        TabView {
            PlacesView(places: allPlaces)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            ARView2()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView(places: allPlaces)
    }
}
