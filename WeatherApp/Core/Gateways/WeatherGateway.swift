//
//  WeatherGateway.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation
import Combine

protocol WeatherGateway {
    func fetchDailyWeather(cityName: String, unit: String, numberOfDays: Int) -> AnyPublisher<[Weather], ApiError>
}
