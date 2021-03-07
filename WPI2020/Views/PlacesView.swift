//
//  PlacesView.swift
//  WPI2020
//
//  Created by Сергей Образцов on 02.03.2021.
//

import SwiftUI

struct PlacesView: View {
    
    private var places: [Place] = Constants.allPlaces
    
    var body: some View {
        NavigationView {
            List {
                ForEach(places) { place in
                    NavigationLink(destination: CameraView(place: place)) {
                        HStack {
                            Text(place.name)
                        }
                    }
                }
            }
            .navigationTitle(PlacesStrings.pickAPlace)
        }
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
    }
}
