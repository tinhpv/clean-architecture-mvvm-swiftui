//
//  ApiDailyWeather.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation

struct ApiDailyWeather: Decodable {
    var list: [ApiWeather]
}
