//
//  ContentView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 01.03.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalManager: GlobalManager
    @State private var isActive = false
    @State var placeName = ""
    private let locationManager = LocationManager.shared
    
    var body: some View {
        NavigationView {
            ZStack{
            PlacesView()
                .environmentObject(globalManager)
            NavigationLink(destination: CameraView(place: placeName), isActive: $isActive) { }
            }
        }
        .onAppear() {
            locationManager.getLocation { result in
                switch result {
                case .failure:
                    break
                case .success(let place):
                    isActive = true
                    placeName = place
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
