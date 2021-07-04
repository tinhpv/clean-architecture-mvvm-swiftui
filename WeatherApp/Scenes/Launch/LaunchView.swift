//
//  LaunchView.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/4/21.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        return ViewFactory<DailyWeatherView>()
            .build(DailyWeatherView.ViewModel.init)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
