//
//  NaverMapView.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/12.
//

import SwiftUI
import NMapsMap
import UIKit
import Combine

struct NaverMapView: UIViewRepresentable {
    @ObservedObject var locationViewModel:LocationViewModel = LocationViewModel()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.mapView.zoomLevel = 17
        view.mapView.touchDelegate = context.coordinator
        view.mapView.addCameraDelegate(delegate: context.coordinator)
        view.mapView.addOptionDelegate(delegate: context.coordinator)
        view.mapView.positionMode = .direction
        view.showLocationButton = true
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        locationViewModel.getLocation()
            .sink { receiveValue in
                guard let location = receiveValue else { return }
                let cameraPosition = NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
                let cameraUpdate = NMFCameraUpdate(scrollTo: cameraPosition)
                uiView.mapView.moveCamera(cameraUpdate)
            }
            .store(in: &context.coordinator.storage)
    }
    
    class Coordinator: NSObject, NMFMapViewTouchDelegate, NMFMapViewCameraDelegate, NMFMapViewOptionDelegate {
        var storage = Set<AnyCancellable>()
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

struct NaverMapView_Previews: PreviewProvider {
    static var previews: some View {
        NaverMapView()
    }
}


