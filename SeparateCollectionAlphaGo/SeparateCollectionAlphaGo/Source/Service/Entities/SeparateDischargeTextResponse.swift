//
//  SeparateDischargeTextResponse.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

struct SeparateDischargeTextResponse {
    var typeOfRecycleable: [TypeOfRecyclable] /* 재활용품 대상s */
    var separateDischargeTips: [SeparateDischargeTip]  /* 분리 배출 요령s */
    
    init(typeOfRecycleable: [TypeOfRecyclable], separateDischargeTips: [SeparateDischargeTip]){
        self.typeOfRecycleable = typeOfRecycleable
        self.separateDischargeTips = separateDischargeTips
    }
}
