//
//  CameraView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 02.03.2021.
//

import SwiftUI


struct CameraView: View {
    @StateObject var cameraModel = CameraModel()
    var body: some View {
        ZStack {
            CameraPreview(cameraModel: cameraModel)
                .ignoresSafeArea(.all)
        }
        .onAppear(perform: {
            cameraModel.setupCameraModel()
            
        })
        .alert(isPresented: $cameraModel.isAlertNeeded, content: {
            Alert(title: Text("plz give us access"))
        })
    }
}
