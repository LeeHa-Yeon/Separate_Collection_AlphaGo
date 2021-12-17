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
    
    func search(_ word: String) -> AnyPublisher<OpenApiResponse, Error> {
        let parameters: [String: Any] = [
            "Type": "json",
            "SIGUN_NM": word,
        ]
        let pullPath = self.endPoint + "?\(apiKey!)"
        return Future<OpenApiResponse, Error> { promise in
            AF.request(pullPath, parameters: parameters).validate().publishDecodable(type: OpenApiResponse.self).result().sink { result in
                switch result {
                case let .success(response):
                    promise(.success(response))
                case .failure:
                    promise(.failure(APIError.unknownError))
                }
            }
            .store(in: &self.storage)
        }.eraseToAnyPublisher()
    }
}
