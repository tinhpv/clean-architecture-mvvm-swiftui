//
//  ApiWeatherGateway.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation
import Combine

class ApiWeatherGateway: WeatherGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchDailyWeather(cityName: String, unit: String, numberOfDays: Int) -> AnyPublisher<[Weather], ApiError> {
        let weatherApiRequest = WeatherDailyRequest(days: numberOfDays,
                                                    cityName: cityName,
                                                    unit: unit)
        return apiClient.execute(request: weatherApiRequest,
                          returnType: ApiDailyWeather.self)
                .map { $0.list.map { $0.weather } }
                .eraseToAnyPublisher()
    }
}
