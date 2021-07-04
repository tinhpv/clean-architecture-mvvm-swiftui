//
//  WeatherDailyRequest.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation

struct WeatherDailyRequest: ApiRequest {
    let days: Int
    let cityName: String
    let unit: String
    
    var urlRequest: URLRequest {
        let queryCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url: URL! = URL(string: "\(AppConstants.apiBaseURL)/data/2.5/forecast/daily?" +
                                "q=\(queryCityName)&" +
                                "cnt=\(days)&" +
                                "appid=\(AppConstants.apiKey)&" +
                                "units=\(unit)")
            
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
}
