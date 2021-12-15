//
//  MapViewModel.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/12.
//
import CoreLocation
import Foundation
import Combine

class MapViewModel: ObservableObject {
    private let locationService: LocationService = LocationService()
    private let trashService: TrashService = TrashService()
    
    init() {
        trashService.search("광명시")
    }
    
    func getLocation() -> AnyPublisher<CLLocation?, Never> {
        return locationService.locationSubject.eraseToAnyPublisher()
    }
}
