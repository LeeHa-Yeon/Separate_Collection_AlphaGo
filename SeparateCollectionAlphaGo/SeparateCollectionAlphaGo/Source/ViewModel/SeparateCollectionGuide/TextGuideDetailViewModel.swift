//
//  TextGuideDetailViewModel.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

class TextGuideDetailViewModel {
    let collectionType: [String] = ["투명페트병","플라스틱류","골판지류","종이류","유리병류","금속캔류","스티로폼","비닐류"]
    let classification: Observable<String> = Observable(value: "") // 분류
    let applicableItems: Observable<String> = Observable(value: "") // 해당 품목(분류에 해당하는)
    let dischargeGuidelines: Observable<String> = Observable(value: "") // 분류 배출 요령
    let nonApplicableItems: Observable<String> = Observable(value: "") // 해당되지 않는 품목(분류에 해당하는)
}
