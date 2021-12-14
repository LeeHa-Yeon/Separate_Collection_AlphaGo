//
//  OpenAPIResponse.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/14.
//

import Foundation

struct OpenAPIResponse:Codable {
    let ctprvnNm: String? //시도명
    let signguNm: String?    //시군구명
    let manageZoneNm: String?    //관리구역명
    let manageZoneAreaNm: String?    //관리구역대상지역명
    let exhstPlaceType: String?  //배출장소유형
    let exhstPlace: String?  //배출장소
    let lvlhTrashExhstMth: String?   //생활쓰레기배출방법
    let fdTrashExhstMth: String? //음식물쓰레기배출방법
    let ruseExhstMth: String?    //재활용품배출방법
    let wsteExhstMth: String?   //일시적다량폐기물배출방법
    let wsteExhstPlace: String?  //일시적다량폐기물배출장소
    let lvlhExhstAy: String?//생활쓰레기배출요일
    let fdExhstDay: String?//음식물쓰레기배출요일
    let ruseExhstAy: String?//재활용품배출요일
    let lvlhTrashBeginTime: String?  //생활쓰레기배출시작시각
    let lvlhTrashEndTime: String? //생활쓰레기배출종료시각
    let fdTrashBeginTime: String?//음식물쓰레기배출시작시각
    let fdTrashEndTime: String?  //음식물쓰레기배출종료시각
    let ruseBeginTime: String?   //재활용품배출시작시각
    let ruseEndTime: String? //재활용품배출종료시각
    let wsteBeginTime: String?   //일시적다량폐기물배출시작시각
    let wsteEndTime: String? //일시적다량폐기물배출종료시각
    let noneTkawyDay: String?    //미수거일
    let chrgDeptNm: String?  //관리부서명
    let phoneNumber: String? //관리부서전화번호
    let referenceDate: String?   //데이터기준일자
    let insttCode: String?   //제공기관키도
    let insttNm: String? //제공기관명
    
    enum CodingKeys: String, CodingKey {
        case ctprvnNm
        case signguNm
        case manageZoneNm
        case manageZoneAreaNm
        case exhstPlaceType
        case exhstPlace
        case lvlhTrashExhstMth
        case fdTrashExhstMth
        case ruseExhstMth
        case wsteExhstMth
        case wsteExhstPlace
        case lvlhExhstAy
        case fdExhstDay
        case ruseExhstAy
        case lvlhTrashBeginTime
        case lvlhTrashEndTime
        case fdTrashBeginTime
        case fdTrashEndTime
        case ruseBeginTime
        case ruseEndTime
        case wsteBeginTime
        case wsteEndTime
        case noneTkawyDay
        case chrgDeptNm
        case phoneNumber
        case referenceDate
        case insttCode
        case insttNm
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ctprvnNm = try values.decodeIfPresent(String.self, forKey: .ctprvnNm)!
        signguNm = try values.decodeIfPresent(String.self, forKey: .signguNm)
        manageZoneNm = try values.decodeIfPresent(String.self, forKey: .manageZoneNm)
        manageZoneAreaNm = try values.decodeIfPresent(String.self, forKey: .manageZoneAreaNm)
        exhstPlaceType = try values.decodeIfPresent(String.self, forKey: .exhstPlaceType)
        exhstPlace = try values.decodeIfPresent(String.self, forKey: .exhstPlace)
        lvlhTrashExhstMth = try values.decodeIfPresent(String.self, forKey: .lvlhTrashExhstMth)
        fdTrashExhstMth = try values.decodeIfPresent(String.self, forKey: .fdTrashExhstMth)
        ruseExhstMth = try values.decodeIfPresent(String.self, forKey: .ruseExhstMth)
        wsteExhstMth = try values.decodeIfPresent(String.self, forKey: .wsteExhstMth)
        wsteExhstPlace = try values.decodeIfPresent(String.self, forKey: .wsteExhstPlace)
        lvlhExhstAy = try values.decodeIfPresent(String.self, forKey: .lvlhExhstAy)
        fdExhstDay = try values.decodeIfPresent(String.self, forKey: .fdExhstDay)
        ruseExhstAy = try values.decodeIfPresent(String.self, forKey: .ruseExhstAy)
        lvlhTrashBeginTime = try values.decodeIfPresent(String.self, forKey: .lvlhTrashBeginTime)
        lvlhTrashEndTime = try values.decodeIfPresent(String.self, forKey: .lvlhTrashEndTime)
        fdTrashBeginTime = try values.decodeIfPresent(String.self, forKey: .fdTrashBeginTime)
        fdTrashEndTime = try values.decodeIfPresent(String.self, forKey: .fdTrashEndTime)
        ruseBeginTime = try values.decodeIfPresent(String.self, forKey: .ruseBeginTime)
        ruseEndTime = try values.decodeIfPresent(String.self, forKey: .ruseEndTime)
        wsteBeginTime = try values.decodeIfPresent(String.self, forKey: .wsteBeginTime)
        wsteEndTime = try values.decodeIfPresent(String.self, forKey: .wsteEndTime)
        noneTkawyDay = try values.decodeIfPresent(String.self, forKey: .noneTkawyDay)
        chrgDeptNm = try values.decodeIfPresent(String.self, forKey: .chrgDeptNm)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        referenceDate = try values.decodeIfPresent(String.self, forKey: .referenceDate)
        insttCode = try values.decodeIfPresent(String.self, forKey: .insttCode)
        insttNm = try values.decodeIfPresent(String.self, forKey: .insttNm)
    }
}
