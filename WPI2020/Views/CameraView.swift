//
//  CameraView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 02.03.2021.
//

import SwiftUI
import AVFoundation


struct CameraView: View {
    // MARK: - Private constant
    private let arViewController = ARViewController.shared
    private let imageTimer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    // MARK: -  Private variables
    @State private var images = [PlaceImage]()
    // MARK: -  Public variables
    var place: Place
    
    var body: some View {
        VStack {
            ARViewRepresentable()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.horizontal){
                HStack {
                    ForEach(images){image in
                        Image(uiImage: image.image)
                            .resizable()
                            .scaledToFill()
                    }
                }
            }.frame(height: 100)
        }
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
        // MARK: - LifeCycle
        .onDisappear(perform: {
            self.images.removeAll()
            self.imageTimer.upstream.connect().cancel()
        })
        // MARK: - Action
        .onReceive(imageTimer) { _ in
            if images.count == 5 {
                images.removeAll()
            }
            self.images.append(PlaceImage(image: arViewController.takeSnapshot()))
        }
    }
}
