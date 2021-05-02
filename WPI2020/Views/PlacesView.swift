//
//  PlacesView.swift
//  WPI2020
//
//  Created by Сергей Образцов on 02.03.2021.
//

import SwiftUI

struct PlacesView: View {
    @EnvironmentObject var globalManager: GlobalManager
    private var places: [Place] = Constants.allPlaces
    
    var body: some View {
            VStack{
                Text(globalManager.pickText)
                    .font(.largeTitle)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                List {
                    ForEach(places) { place in
                        NavigationLink(destination: CameraView(place: place.name)) {
                            HStack {
                                Text(place.name)
                            }
                        }
                    }
                }
            }
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
            .environmentObject(GlobalManager())
    }
}
