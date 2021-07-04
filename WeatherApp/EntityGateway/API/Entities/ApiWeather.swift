//
//  ApiWeather.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation

struct ApiWeather: Decodable {
    var dt: Int
    var temp: Temparature
    var pressure: Int
    var humidity: Int
    var weatherDetail: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case pressure
        case humidity
        case weatherDetail = "weather"
    }
}

extension ApiWeather {
    var weather: Weather {
        let avgTemp = (temp.max + temp.min) / 2
        let weatherIcon = weatherDetail.first?.icon
        let weatherDesc = weatherDetail.first?.description
        let iconUrl = URL(string: "\(AppConstants.apiBaseURL)/img/w/\(weatherIcon ?? "").png")
        return .init(date: dt,
                     avgTemparature: Int(avgTemp.rounded()),
                     pressure: pressure,
                     humidity: humidity,
                     description: weatherDesc,
                     iconUrl: iconUrl)
    }
}
