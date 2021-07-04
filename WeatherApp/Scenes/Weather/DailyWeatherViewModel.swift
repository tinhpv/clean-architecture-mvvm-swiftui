//
//  DailyWeatherViewModel.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/4/21.
//

import Foundation
import Combine

extension DailyWeatherView {
    final class ViewModel: ObservableObject {
        private var cancellable = Set<AnyCancellable>()
        private let activityTracker = ActivityTracker(false)
        private var errorTracker = ErrorTracker()
        private var usecase: ShowDailyWeatherUseCase
        
        // INPUT
        @Published var citySearchText: String = ""
        
        // OUTPUT
        @Published private(set) var dailyWeather: [Weather] = []
        @Published var isLoading: Bool = false
        @Published var isValidSearch: Bool = true
        @Published var alert = AlertMessage()
        
        init(usecase: ShowDailyWeatherUseCase) {
            self.usecase = usecase
            $citySearchText
                .dropFirst(1)
                .filter { $0.count > 2 }
                .sink(receiveValue: loadWeather(cityName:))
                .store(in: &cancellable)
            
            $citySearchText
                .dropFirst(1)
                .filter { $0.count <= 2 && $0.count > 0 }
                .map { _ in AlertMessage(title: "Error", message: "Search text length should be greater than 2", isShowing: true) }
                .assign(to: \.alert, on: self)
                .store(in: &cancellable)
            
            $citySearchText
                .dropFirst(1)
                .filter { $0.count <= 2 }
                .sink { _ in
                    self.dailyWeather = []
                }
                .store(in: &cancellable)
            
            activityTracker
                .receive(on: DispatchQueue.main)
                .assign(to: \.isLoading, on: self)
                .store(in: &cancellable)
            
            errorTracker
                .receive(on: DispatchQueue.main)
                .compactMap { AlertMessage(error: ($0 as? ApiError)) }
                .assign(to: \.alert, on: self)
                .store(in: &cancellable)
        }
        
        private func loadWeather(cityName: String) {
            self.usecase.showDailyWeather(cityName: cityName, unit: "metric", numberOfDays: 7)
                .trackActivity(activityTracker)
                .trackError(errorTracker)
                .replaceError(with: [])
                .eraseToAnyPublisher()
                .receive(on: DispatchQueue.main)
                .assign(to: \.dailyWeather, on: self)
                .store(in: &cancellable)
        }
    }
}


