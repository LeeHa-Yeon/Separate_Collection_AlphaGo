//
//  LocationViewModel.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/12.
//
import CoreLocation
import Foundation
import Combine

class LocationViewModel: ObservableObject {
    private let locationService: LocationService = LocationService()
    
    func getLocation() -> AnyPublisher<CLLocation?, Never> {
        return locationService.locationSubject.eraseToAnyPublisher()
    }
}
