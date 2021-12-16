//
//  SeparateCollectionGuideViewModel.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

class SeparateCollectionGuideViewModel {
    let recyclingGuidelineService = RecyclingGuidelineService.shared // api manager
    var separateResponse = Observable(value:SeparateDischargeTextResponse(typeOfRecycleable: [],
                                                                          separateDischargeTips: [])) // 분리배출 요령 텍스트 정보
    var recyclingSeparateDischargeUrls: [String] = [String]() // 재활용품 분리배출 이미지
    var separateDischargeTipUrls: [String] = [String]() // 분리배출 요령 이미지
    
    /* 재활용품 분리배출 이미지 크롤링 */
    func requestRecyclingSeparateDischargeGuidelines(){
        self.recyclingGuidelineService.requestRecyclingSeparateDischargeGuidelines(){ urls in
            self.recyclingSeparateDischargeUrls.append(contentsOf: urls)
        }
    }
    
    /* 분리배출 요령 이미지 크롤링 */
    func requestSeparateDischargeGuidelines(){
        self.recyclingGuidelineService.requestSeparateDischargeGuidelines(){ urls in
            self.separateDischargeTipUrls.append(contentsOf: urls)
        }
    }
    
    /* 재활용품 분리 배출 요령 텍스트 크롤링 */
    func requestSeparateDischargeTextGuidelines(){
        self.recyclingGuidelineService.requestSeparateDischargeTextGuidelines { response in
            self.separateResponse.value = response
        }
    }
}
