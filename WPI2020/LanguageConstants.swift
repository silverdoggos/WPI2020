//
//  LanguageConstraint.swift
//  WPI2020
//
//  Created by Artem Shishkin on 07.03.2021.
//

import Foundation

enum PlacesStrings {
    static let financialUniv = NSLocalizedString("Financial University", comment: "")
    static let hseUniv = NSLocalizedString("Higher School of Economics", comment: "")
    static let wpUniv = NSLocalizedString("Worcester Polytechnic Institute", comment: "")
    
    static let pickAPlaceWithLocation = NSLocalizedString("Choose the place or wait when we get your location...", comment: "")
    
    static let pickAPlace = NSLocalizedString("Choose the place", comment: "")
}

enum CameraString {
    static let waiting = NSLocalizedString("wait while we recognize your room...", comment: "")
    static let room = NSLocalizedString("current room is", comment: "")
    static let errorWithMl = NSLocalizedString("room not recognized", comment: "")
    static let serverError = NSLocalizedString("please, check network connection", comment: "")
}
