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
    @Published var address: String? = nil
    private var storage = Set<AnyCancellable>()
    private let locationService: LocationService = LocationService()
    private let trashService: TrashService = TrashService()

    
    init() {
        trashService.search("강남구")
    }
    
    func getAddress() {
        locationService.locationSubject.eraseToAnyPublisher()
            .sink { receiveValue in
                guard let location = receiveValue else { return }
                let geocoder = CLGeocoder()
                let locale = Locale(identifier: "Ko-kr")
                geocoder.reverseGeocodeLocation(location, preferredLocale: locale) { placemark, error in
                    if let address: [CLPlacemark] = placemark {
                        print(address.last?.locality)
                    }
                }
            }
            .store(in: &storage)
    }
}
