//
//  CameraView.swift
//  WPI2020
//
//  Created by Artem Shishkin on 02.03.2021.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @EnvironmentObject var globalManager: GlobalManager
    // MARK: - Private constant
    private let arViewController = ARViewController.shared
    private let networkService = NetworkService.shared
    private let imageTimer = Timer.publish(every: 200, on: .main, in: .common).autoconnect()
    // MARK: -  Private variables
    @State private var images = [PlaceImage]()
    @State private var isRoom = false
    @State var text = CameraString.waiting
    // MARK: -  Public variables
    var place: String
    
    var body: some View {
        ZStack(alignment: .top) {
            ARViewRepresentable()
                .edgesIgnoringSafeArea(.bottom)
                
            VStack {
                Text(text)
                    .foregroundColor(.gray)
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.9)
            .background(
                RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 15)
                    .fill(Color.white))
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(place)
        // MARK: - LifeCycle
        .onAppear() {
            globalManager.pickText = PlacesStrings.pickAPlace
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: getData)
        }
        .onDisappear(perform: {
            self.images.removeAll()
            self.imageTimer.upstream.connect().cancel()
        })
        // MARK: - Action
//        .onReceive(imageTimer) { _ in
//            getData()
//        }
    }
    
    private func getData() {
        let image = arViewController.takeSnapshot()
        
        networkService.getRoom(with: image) { result in
            switch result {
            case .success(let rooms):
                var currectRoom = ""
                for key in rooms.keys {
                    if rooms[key] ?? false, currectRoom.isEmpty {
                        currectRoom = key
                    } else if rooms[key] ?? false {
                        currectRoom = CameraString.errorWithMl
                    }
                }
                self.text = currectRoom
            case .failure(let error):
                print(error)
                self.text = CameraString.serverError
            }
        }
    }
}
