//
//  WasteMapView.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/12.
//

import SwiftUI

struct WasteMapView: View {
    @ObservedObject var mapViewModel: MapViewModel = MapViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 1) {
                    ForEach(Array(mapViewModel.wastes.enumerated()), id: \.offset) { items in
                        let waste = items.element
                        WasteListCell(waste: waste)
                    }
                }
            }
            .navigationTitle("분리수거 요령")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WasteMapView_Previews: PreviewProvider {
    static var previews: some View {
        WasteMapView()
    }
}


