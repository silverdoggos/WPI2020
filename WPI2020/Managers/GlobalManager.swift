//
//  GlobalManager.swift
//  WPI2020
//
//  Created by Artem Shishkin on 29.04.2021.
//

import Foundation

class GlobalManager: ObservableObject {
    @Published var pickText = PlacesStrings.pickAPlaceWithLocation
    
    init() {}
}
