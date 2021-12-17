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
    @Published var wastes: [Waste] = []
    private var storage = Set<AnyCancellable>()
    private let locationService: LocationService = LocationService()
    private let trashService: TrashService = TrashService()

    
    init() {
        trashService.search("의왕시")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { com in
                if case .failure = com {
                    self.wastes = []
                }
            }, receiveValue: { response in
                self.wastes = (response.Livelhwstemisninfo?.last!.row!)!
                print(self.wastes)
            })
            .store(in: &self.storage)
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
