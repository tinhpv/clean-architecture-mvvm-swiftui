//
//  GatewayComposition.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/4/21.
//

import Foundation

final class Gateways {
    lazy var apiWeatherGateway: WeatherGateway = {
        let apiClient = ApiClientImpl(urlSessionConfiguration: .default)
        return ApiWeatherGateway(apiClient: apiClient)
    }()
}
