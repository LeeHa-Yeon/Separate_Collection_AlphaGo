//
//  b.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/16.
//

import Foundation

struct DetailInfo: Codable {
    var row: [Waste]?
    
    enum CodingKeys: String, CodingKey {
        case row
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        row = try values.decodeIfPresent([Waste].self, forKey: .row)
    }
}
