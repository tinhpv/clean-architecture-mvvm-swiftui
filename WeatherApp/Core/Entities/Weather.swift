//
//  Weather.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation

struct Weather: Identifiable {
    let id = UUID()
    var date: Int?
    var avgTemparature: Int?
    var pressure: Int?
    var humidity: Int?
    var description: String?
    var iconUrl: URL?
}
