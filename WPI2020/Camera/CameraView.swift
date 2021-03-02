//
//  CameraView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 02.03.2021.
//

import SwiftUI


struct CameraView: View {
    @StateObject var cameraModel = CameraModel()
    var place: Place
    
    var body: some View {
        ZStack {
            CameraPreview(cameraModel: cameraModel)
                .edgesIgnoringSafeArea(.all)
                
            .navigationTitle(place.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: {
            cameraModel.setupCameraModel()
        })
        .alert(isPresented: $cameraModel.isAlertNeeded, content: {
            Alert(title: Text("plz give us access"))
        })
    }
}
