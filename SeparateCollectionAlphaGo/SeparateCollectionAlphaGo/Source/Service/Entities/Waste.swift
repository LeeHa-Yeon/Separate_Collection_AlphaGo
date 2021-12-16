//
//  Waste.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/14.
//

import Foundation

struct Waste:Codable {
    let SIGUN_CD :String?    //시군코드
    let SIGUN_NM :String?    //시군명
    let SIDO_NM :String?   //시도명
    let SIGNGU_NM :String?   //시군구명
    let MANAGE_ZONE_NM  :String?  //관리구역명
    let MANAGE_ZONE_TGRG_NM_INFO:String?   // 관리구역대상지역명
    let EMISN_PLC_TYPE:String?    //배출장소유형
    let EMISN_PLC:String?    // 배출장소
    let LIVELH_WST_EMISN_METH:String?    //생활쓰레기배출방법
    let FODNDRK_WST_EMISN_METH   :String? //음식물쓰레기배출방법
    let REHABT_SUPLI_EMISN_METH    :String?//재활용품배출방법
    let TEMPRY_MUCH_WST_EMISN_METH   :String?// 일시적다량폐기물배출방법
    let TEMPRY_MUCH_WST_EMISN_PLC:String?    //일시적다량폐기물배출장소
    let LIVELH_WST_EMISN_WDAY    :String?//생활쓰레기배출요일
    let FODNDRK_WST_EMISN_WDAY    :String?//음식물쓰레기배출요일
    let REHABT_SUPLI_EMISN_WDAY    :String?//재활용품배출요일
    let LIVELH_WST_EMISN_BEGIN_TM   :String?// 생활쓰레기배출시작시각
    let LIVELH_WST_EMISN_END_TM    :String?//생활쓰레기배출종료시각
    let FODNDRK_WST_EMISN_BEGIN_TM :String?  // 음식물쓰레기배출시작시각
    let FODNDRK_WST_EMISN_END_TM   :String? //음식물쓰레기배출종료시각
    let REHABT_SUPLI_EMISN_BEGIN_TM :String?  // 재활용품배출시작시각
    let REHABT_SUPLI_EMISN_END_TM  :String?  //재활용품배출종료시각
    let TEMPRY_MUCH_WST_EMISN_BEGIN_TM:String?//    일시적다량폐기물배출시작시각
    let TEMPRY_MUCH_WST_EMISN_END_TM  :String?  //일시적다량폐기물배출종료시각
    let NON_TKAWAY_DE_INFO  :String? // 미수거일
    let MANAGE_DEPT_NM :String?  // 관리부서명
    let MANAGE_DEPT_TELNO :String? //  관리부서전화번호
    let DATA_STD_DE  :String?  //데이터기준일자
    
    enum CodingKeys: String, CodingKey {
        case SIGUN_CD    //시군코드
        case SIGUN_NM    //시군명
        case SIDO_NM    //시도명
        case SIGNGU_NM    //시군구명
        case MANAGE_ZONE_NM    //관리구역명
        case MANAGE_ZONE_TGRG_NM_INFO   // 관리구역대상지역명
        case EMISN_PLC_TYPE    //배출장소유형
        case EMISN_PLC    //배출장소
        case LIVELH_WST_EMISN_METH    //생활쓰레기배출방법
        case FODNDRK_WST_EMISN_METH    //음식물쓰레기배출방법
        case REHABT_SUPLI_EMISN_METH    //재활용품배출방법
        case TEMPRY_MUCH_WST_EMISN_METH   // 일시적다량폐기물배출방법
        case TEMPRY_MUCH_WST_EMISN_PLC    //일시적다량폐기물배출장소
        case LIVELH_WST_EMISN_WDAY    //생활쓰레기배출요일
        case FODNDRK_WST_EMISN_WDAY    //음식물쓰레기배출요일
        case REHABT_SUPLI_EMISN_WDAY    //재활용품배출요일
        case LIVELH_WST_EMISN_BEGIN_TM   // 생활쓰레기배출시작시각
        case LIVELH_WST_EMISN_END_TM    //생활쓰레기배출종료시각
        case FODNDRK_WST_EMISN_BEGIN_TM   // 음식물쓰레기배출시작시각
        case FODNDRK_WST_EMISN_END_TM    //음식물쓰레기배출종료시각
        case REHABT_SUPLI_EMISN_BEGIN_TM   // 재활용품배출시작시각
        case REHABT_SUPLI_EMISN_END_TM    //재활용품배출종료시각
        case TEMPRY_MUCH_WST_EMISN_BEGIN_TM//    일시적다량폐기물배출시작시각
        case TEMPRY_MUCH_WST_EMISN_END_TM    //일시적다량폐기물배출종료시각
        case NON_TKAWAY_DE_INFO   // 미수거일
        case MANAGE_DEPT_NM   // 관리부서명
        case MANAGE_DEPT_TELNO  //  관리부서전화번호
        case DATA_STD_DE
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        SIGUN_CD = try values.decodeIfPresent(String.self, forKey: .SIGUN_CD)
        SIGUN_NM = try values.decodeIfPresent(String.self, forKey: .SIGUN_CD)
        SIDO_NM = try values.decodeIfPresent(String.self, forKey: .SIDO_NM)
        SIGNGU_NM = try values.decodeIfPresent(String.self, forKey: .SIGNGU_NM)
        MANAGE_ZONE_NM = try values.decodeIfPresent(String.self, forKey: .MANAGE_ZONE_NM)
        MANAGE_ZONE_TGRG_NM_INFO = try values.decodeIfPresent(String.self, forKey: .MANAGE_ZONE_TGRG_NM_INFO)
        EMISN_PLC_TYPE = try values.decodeIfPresent(String.self, forKey: .EMISN_PLC_TYPE)
        EMISN_PLC = try values.decodeIfPresent(String.self, forKey: .EMISN_PLC)
        LIVELH_WST_EMISN_METH = try values.decodeIfPresent(String.self, forKey: .LIVELH_WST_EMISN_METH)
        FODNDRK_WST_EMISN_METH = try values.decodeIfPresent(String.self, forKey: .FODNDRK_WST_EMISN_METH)
        REHABT_SUPLI_EMISN_METH = try values.decodeIfPresent(String.self, forKey: .REHABT_SUPLI_EMISN_METH)
        TEMPRY_MUCH_WST_EMISN_METH = try values.decodeIfPresent(String.self, forKey: .TEMPRY_MUCH_WST_EMISN_METH)
        TEMPRY_MUCH_WST_EMISN_PLC = try values.decodeIfPresent(String.self, forKey: .TEMPRY_MUCH_WST_EMISN_PLC)
        LIVELH_WST_EMISN_WDAY = try values.decodeIfPresent(String.self, forKey: .LIVELH_WST_EMISN_WDAY)
        FODNDRK_WST_EMISN_WDAY = try values.decodeIfPresent(String.self, forKey: .FODNDRK_WST_EMISN_WDAY)
        REHABT_SUPLI_EMISN_WDAY = try values.decodeIfPresent(String.self, forKey: .REHABT_SUPLI_EMISN_WDAY)
        LIVELH_WST_EMISN_BEGIN_TM = try values.decodeIfPresent(String.self, forKey: .LIVELH_WST_EMISN_BEGIN_TM)
        LIVELH_WST_EMISN_END_TM = try values.decodeIfPresent(String.self, forKey: .LIVELH_WST_EMISN_END_TM)
        FODNDRK_WST_EMISN_BEGIN_TM = try values.decodeIfPresent(String.self, forKey: .FODNDRK_WST_EMISN_BEGIN_TM)
        FODNDRK_WST_EMISN_END_TM = try values.decodeIfPresent(String.self, forKey: .FODNDRK_WST_EMISN_END_TM)
        REHABT_SUPLI_EMISN_BEGIN_TM = try values.decodeIfPresent(String.self, forKey: .REHABT_SUPLI_EMISN_BEGIN_TM)
        REHABT_SUPLI_EMISN_END_TM = try values.decodeIfPresent(String.self, forKey: .REHABT_SUPLI_EMISN_END_TM)
        TEMPRY_MUCH_WST_EMISN_BEGIN_TM = try values.decodeIfPresent(String.self, forKey: .TEMPRY_MUCH_WST_EMISN_BEGIN_TM)
        TEMPRY_MUCH_WST_EMISN_END_TM = try values.decodeIfPresent(String.self, forKey: .TEMPRY_MUCH_WST_EMISN_END_TM)
        NON_TKAWAY_DE_INFO = try values.decodeIfPresent(String.self, forKey: .NON_TKAWAY_DE_INFO)
        MANAGE_DEPT_NM = try values.decodeIfPresent(String.self, forKey: .MANAGE_DEPT_NM)
        MANAGE_DEPT_TELNO = try values.decodeIfPresent(String.self, forKey: .MANAGE_DEPT_TELNO)
        DATA_STD_DE = try values.decodeIfPresent(String.self, forKey: .DATA_STD_DE)
    }
}
