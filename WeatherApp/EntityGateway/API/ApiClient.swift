//
//  ApiClient.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation
import Combine

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol ApiRequest {
    var urlRequest: URLRequest { get }
}

protocol ApiClient {
    func execute<T: Decodable>(request: ApiRequest, returnType: T.Type) -> AnyPublisher<T, ApiError>
}

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

class ApiClientImpl: ApiClient {
    let urlSession: URLSessionProtocol
    
    init(urlSessionConfiguration: URLSessionConfiguration) {
        urlSession = URLSession(configuration: urlSessionConfiguration)
    }
    
    init(urlSession: URLSessionProtocol) {
        self.urlSession = urlSession
    }
    
    func execute<T: Decodable>(request: ApiRequest,
                    returnType: T.Type) -> AnyPublisher<T, ApiError> {
        URLSession.shared
            .dataTaskPublisher(for: request.urlRequest)
            .map(\.data)
            .decode(type: returnType.self, decoder: JSONDecoder())
            .mapError({ (error) -> ApiError in
                return ApiError(error: error,
                                data: nil,
                                httpUrlResponse: nil)
            })
            .eraseToAnyPublisher()
    }
}
