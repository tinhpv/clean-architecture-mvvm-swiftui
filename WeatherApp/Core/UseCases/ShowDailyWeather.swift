//
//  ShowDailyWeather.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation
import Combine

protocol ShowDailyWeatherUseCase {
    func showDailyWeather(cityName: String,
                          unit: String,
                          numberOfDays: Int) -> AnyPublisher<[Weather], ApiError>
}

class ShowDailyWeatherUseCaseImpl: ShowDailyWeatherUseCase {
    let weatherGateway: WeatherGateway
    
    init(weatherGateway: WeatherGateway) {
        self.weatherGateway = weatherGateway
    }
    
    func showDailyWeather(cityName: String,
                          unit: String = "metric",
                          numberOfDays: Int = 7) -> AnyPublisher<[Weather], ApiError> {
        return self.weatherGateway.fetchDailyWeather(cityName: cityName, unit: unit, numberOfDays: numberOfDays)
            .eraseToAnyPublisher()
    }
}
