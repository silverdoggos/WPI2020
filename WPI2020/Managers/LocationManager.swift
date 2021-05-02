//
//  LocationManager.swift
//  WPI2020
//
//  Created by Artem Shishkin on 28.04.2021.
//

import Foundation
import CoreLocation

struct LocationError: Error {
    
    // MARK: - Public variables
    
    let text: String
    
    // MARK: - Life cycle
    init(text: String) {
        self.text = text
    }
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    private let manager = CLLocationManager()
    var adress: String?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else { return }
        geocode(latitude: location.latitude, longitude: location.longitude) { placemark, error in
            guard let city = placemark?.locality, let street = placemark?.thoroughfare, let house = placemark?.subThoroughfare,  error == nil else { return }
            
            self.adress = "\(city) \(street) \(house)"
        }
    }

    func getLocation(completion: @escaping (Result<String, Error>) -> Void) {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        var rowCount = 0
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] timer in
            guard let self = self else { return }
            rowCount += 1
            if self.isLocation(), let location = self.adress {
                completion(.success("\(location)"))
                timer.invalidate()
                return
            } else if rowCount == 15 {
                completion(.failure(LocationError(text: "can not get location")))
                timer.invalidate()
                return
            }
        }
    }

    
    private func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { completion($0?.first, $1) } }
    
    private func isLocation() -> Bool {
        if adress != nil {
            return true
        }
        return false
    }
}
