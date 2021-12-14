//
//  TrashService.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/14.
//

import Foundation
import Alamofire
import Combine

class TrashService {
    private let endPoint = "http://api.data.go.kr/openapi/tn_pubr_public_lvlh_trash_api"
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
    
    func search(_ word: String, _ page: Int) throws -> AnyPublisher<OpenAPIResponse, Error> {
        guard let apiKey = apiKey else { throw APIError.missingAPIKey }
        let parameters: [String: Any] = [
            "serviceKey": apiKey,
        ]
        return Future<OpenAPIResponse, Error> { promise in
            AF.request(self.endPoint, parameters: parameters).validate().publishDecodable(type: OpenAPIResponse.self).result().sink { result in
                switch result {
                case let .success(response):
                    promise(.success(response))
                case .failure:
                    promise(.failure(APIError.unknownError))
                }
            }.store(in: &self.storage)
        }.eraseToAnyPublisher()
    }
}
