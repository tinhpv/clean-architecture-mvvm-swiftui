//
//  DailyWeatherViewComposition.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/4/21.
//

import Foundation

extension DailyWeatherView.ViewModel {
    convenience init(diContainer: DIContainer) {
        self.init(usecase: diContainer.dailyWeatherUsecase)
    }
}

private extension DIContainer {
    var dailyWeatherUsecase: ShowDailyWeatherUseCase {
        return ShowDailyWeatherUseCaseImpl(weatherGateway: weatherGateways.apiWeatherGateway)
    }
}
