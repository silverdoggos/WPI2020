//
//  ContentView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 01.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlacesView(places: allPlaces)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView(places: allPlaces)
    }
}
