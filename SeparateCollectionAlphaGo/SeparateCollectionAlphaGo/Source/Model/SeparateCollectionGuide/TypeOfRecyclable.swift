//
//  TypeOfRecyclable.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

/* 재활용품 대상 */
struct TypeOfRecyclable {
    let classification: String // 분류
    let applicableItems: String // 해당 품목(분류에 해당하는)
    let nonApplicableItems: String // 해당되지 않는 품목(분류에 해당하는)
    
    init(classification: String, applicableItems: String, nonApplicableItems: String){
        self.classification = classification
        self.applicableItems = applicableItems
        self.nonApplicableItems = nonApplicableItems
    }
}
