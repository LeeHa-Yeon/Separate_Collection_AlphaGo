//
//  SeparateDischargeTips.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

/* 분리 배출 요령 */
struct SeparateDischargeTip {
    let classification: String // 분류
    let applicableItems: String // 해당 품목(분류에 해당하는)
    let dischargeGuidelines: String // 분류 배출 요령
    
    init(classification: String, applicableItems: String, dischargeGuidelines: String){
        self.classification = classification
        self.applicableItems = applicableItems
        self.dischargeGuidelines = dischargeGuidelines
    }
}
