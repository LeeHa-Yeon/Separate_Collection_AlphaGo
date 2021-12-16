//
//  OpenApiResponse.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/16.
//

import Foundation

struct OpenApiResponse: Codable {
    var Livelhwstemisninfo: [DetailInfo]?
    
    enum CodingKeys: String, CodingKey {
        case Livelhwstemisninfo
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        Livelhwstemisninfo = try values.decodeIfPresent([DetailInfo].self, forKey: .Livelhwstemisninfo)
    }
}


