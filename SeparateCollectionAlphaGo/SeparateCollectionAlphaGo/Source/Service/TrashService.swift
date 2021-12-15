//
//  TrashService.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/14.
//

import Foundation
import Alamofire
import Combine
import SWXMLHash

class TrashService {
    private let endPoint = "https://openapi.gg.go.kr/Livelhwstemisninfo"
    private var apiKey: String? {
        guard let apiKey = (Bundle.main.object(forInfoDictionaryKey: "OpenAPIKey")! as? String)?.replacingOccurrences(of: "\"", with: "") else {
            return nil
        }
        return apiKey
    }
    private var storage = Set<AnyCancellable>()

    enum APIError: Error {
        case missingAPIKey
        case unknownError
    }
    
    func search(_ word: String) {
//        guard let apiKey = apiKey else { throw APIError.missingAPIKey }
        let parameters: [String: Any] = [
            "SIGUN_NM": word,
        ]
        let pullPath = self.endPoint + "?\(apiKey!)"
        print(pullPath)
        AF.request(pullPath, parameters: parameters).response { response in
            print(response.data)
            let xml = XMLHash.parse(response.data!)
            print(xml)
            print(xml["Livelhwstemisninfo"]["row"]["EMISN_PLC"].element?.text)   
        }
    }
}
