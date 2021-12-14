//
//  WasteMapView.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/12.
//

import SwiftUI

struct WasteMapView: View {
    var body: some View {
        NavigationView {
            NaverMapView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("지도")
        }
    }
}

struct WasteMapView_Previews: PreviewProvider {
    static var previews: some View {
        WasteMapView()
    }
}


