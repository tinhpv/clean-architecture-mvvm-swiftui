//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/4/21.
//

import SwiftUI
import Combine

struct DailyWeatherView: PatternView {
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.citySearchText,
                          placeHolder: "Search your city")
                Divider()
                LoadingView(isShowing: $viewModel.isLoading, text: .constant("")) {
                    List {
                        ForEach(viewModel.dailyWeather) { weather in
                            WeatherRow(weather: weather)
                        }
                    }
                    .padding(.init(top: -8, leading: 0, bottom: 0, trailing: 0))
                    .listStyle(PlainListStyle())
                }
                .alert(isPresented: $viewModel.alert.isShowing) {
                    Alert(
                        title: Text(viewModel.alert.title),
                        message: Text(viewModel.alert.message),
                        dismissButton: .default(Text("Close"))
                    )
                }
            }
            .navigationBarTitle("Weather Forecast", displayMode: .automatic)
        }
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(viewModel: .init(diContainer: .defaultValue))
    }
}
