//
//  NetworkService.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation
import Alamofire
import Combine

public protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, NetworkError>
}

public final class NetworkService: NetworkServiceProtocol {
    private let session: Session

    init(session: Session = Session(eventMonitors: [NetworkLogger()])) {
        self.session = session
    }

    public func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        let method = HTTPMethod(rawValue: endpoint.method.rawValue)
        let headers = HTTPHeaders(endpoint.headers ?? [:])
        let encoding: ParameterEncoding = (method == .get) ? URLEncoding.default : JSONEncoding.default

        return Future<T, NetworkError> { promise in
            self.session.request(
                url,
                method: method,
                parameters: endpoint.parameters,
                encoding: encoding,
                headers: headers
            )
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: data)
                        promise(.success(decoded))
                    } catch {
                        promise(.failure(.decodingError(error)))
                    }
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? -1
                    promise(.failure(.serverError(statusCode)))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
