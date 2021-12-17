//
//  WasteDetailView.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/17.
//

import SwiftUI

struct WasteDetailView: View {
    let waste: Waste
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.5) {
            Group {
                Text("쓰레기 배출 방법 ♽")
                    .font(.system(size: 30))
                    .bold()
                    .padding(1)
                HStack {
                    Text("생활 쓰레기 :")
                        .font(.system(size: 12))
                    Text(waste.LIVELH_WST_EMISN_METH!)
                        .font(.system(size: 12))
                }
                HStack {
                    Text("음식물 쓰레기 :")
                        .font(.system(size: 12))
                    Text(waste.FODNDRK_WST_EMISN_METH!)
                        .font(.system(size: 12))
                }
                HStack {
                    Text("일시적다량폐기물 :")
                        .font(.system(size: 12))
                    Text(waste.TEMPRY_MUCH_WST_EMISN_METH!)
                        .font(.system(size: 12))
                }
                HStack {
                    Text("일시적다량폐기물배출장소 :")
                        .font(.system(size: 12))
                    Text(waste.TEMPRY_MUCH_WST_EMISN_PLC!)
                        .font(.system(size: 12))
                }
                Text("쓰레기 배출 요일 🗓")
                    .font(.system(size: 30))
                    .bold()
                    .padding(1)
                    .padding(.top, 10)
                HStack {
                    Text("생활 쓰레기 :")
                        .font(.system(size: 12))
                    Text(waste.LIVELH_WST_EMISN_WDAY!)
                        .font(.system(size: 12))
                }
                HStack {
                    Text("음식물 쓰레기 :")
                        .font(.system(size: 12))
                    Text(waste.FODNDRK_WST_EMISN_WDAY!)
                        .font(.system(size: 12))
                }
            }
            Group {
                HStack {
                    Text("재활용품 :")
                        .font(.system(size: 12))
                    Text(waste.REHABT_SUPLI_EMISN_WDAY!)
                        .font(.system(size: 12))
                }
                Text("쓰레기 배출 시간 ⏱")
                    .font(.system(size: 30))
                    .bold()
                    .padding(1)
                    .padding(.top, 10)
                HStack {
                    Text("생활 쓰레기 :")
                        .font(.system(size: 12))
                    Text(waste.LIVELH_WST_EMISN_BEGIN_TM! + "~" + waste.LIVELH_WST_EMISN_END_TM!)
                        .font(.system(size: 12))
                }
                HStack {
                    Text("음식물 쓰레기 :")
                        .font(.system(size: 12))
                    Text(waste.FODNDRK_WST_EMISN_BEGIN_TM! + "~" + waste.FODNDRK_WST_EMISN_END_TM!)
                        .font(.system(size: 12))
                }
                HStack {
                    Text("재활용품 :")
                        .font(.system(size: 12))
                    Text(waste.REHABT_SUPLI_EMISN_BEGIN_TM! + "~" + waste.REHABT_SUPLI_EMISN_END_TM!)
                        .font(.system(size: 12))
                }
                HStack {
                    Text("일시적다량폐기물 :")
                        .font(.system(size: 12))
                    Text(waste.TEMPRY_MUCH_WST_EMISN_BEGIN_TM! + "~" + waste.TEMPRY_MUCH_WST_EMISN_END_TM!)
                        .font(.system(size: 12))
                }
            }
            Text("기타")
                .font(.system(size: 30))
                .bold()
                .padding(1)
                .padding(.top, 10)
            HStack {
                Text("미수거일 :")
                    .font(.system(size: 12))
                    .bold()
                Text(waste.NON_TKAWAY_DE_INFO!)
                    .font(.system(size: 12))
                    .bold()
            }
            HStack {
                Text("관리부서명 :")
                    .font(.system(size: 12))
                Text(waste.MANAGE_DEPT_NM!)
                    .font(.system(size: 12))
            }
            HStack {
                Text("관리부서전화번호 :")
                    .font(.system(size: 12))
                Text(waste.MANAGE_DEPT_TELNO!)
                    .font(.system(size: 12))
            }
            Spacer()
        }
    }
}
