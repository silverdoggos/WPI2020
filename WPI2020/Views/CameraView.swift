//
//  CameraView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 02.03.2021.
//

import SwiftUI
import AVFoundation


struct CameraView: View {
    var place: Place
    
    var body: some View {
        ARViewRepresentable()
            .edgesIgnoringSafeArea(.all)
            .navigationTitle(place.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}
