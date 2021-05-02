//
//  WPI2020App.swift
//  WPI2020
//
//  Created by Artem Shishkin on 01.03.2021.
//

import SwiftUI

@main
struct WPI2020App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GlobalManager())
        }
    }
}
