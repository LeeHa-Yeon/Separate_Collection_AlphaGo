//
//  LocationService.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/12.
//

import CoreLocation
import Foundation
import Combine

class LocationService: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private(set) var locationStatus: CLAuthorizationStatus?
    private(set) var lastLocation: CLLocation?
    lazy var locationSubject = CurrentValueSubject<CLLocation?,Never>(lastLocation)
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        locationSubject.send(lastLocation)
    }
}
