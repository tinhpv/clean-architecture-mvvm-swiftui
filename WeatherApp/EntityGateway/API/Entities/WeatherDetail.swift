//
//  WeatherDetail.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation

struct WeatherDetail: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
