//
//  WasteListCell.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/17.
//

import SwiftUI

struct WasteListCell: View {
    let contentHeight: CGFloat = 150
    var waste: Waste
    
    var body: some View {
       ZStack {
            HStack {
                Spacer()
                VStack {
                    Text(waste.EMISN_PLC!)
                        .font(.system(size:13))
                        .foregroundColor(.white)
                }
                .padding(.trailing, 20)
            }
            .frame(height: contentHeight)
            .background(Color.green)
            .opacity(0.8)
            .cornerRadius(10.0)
            .shadow(color: Color.black.opacity(0.2), radius: 5)
            .padding(10)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                    HStack {
                        Text(waste.SIDO_NM! + " " + waste.SIGNGU_NM! + " " + waste.MANAGE_ZONE_NM!)
                        NavigationLink {
                            WasteDetailView(waste: self.waste)
                        } label: {
                            Text(">")
                                .foregroundColor(.gray)
                        }
                    }
                    Text(waste.SIGUN_NM!)
                        .font(.system(size: 10))
                        .foregroundColor(Color.black.opacity(0.8))
                }
                .padding(.leading, 10)
                Spacer()
            }
            .frame(height: contentHeight)
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(color: Color.black.opacity(0.2), radius: 5)
            .padding(.trailing, 80)
            .padding(10)
        }
    }
}
