//
//  NaverMapView.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/12.
//

import SwiftUI
import NMapsMap
import UIKit

struct NaverMapView: UIViewRepresentable {    
    func makeUIView(context: Context) -> some UIView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct NaverMapView_Previews: PreviewProvider {
    static var previews: some View {
        NaverMapView()
    }
}
