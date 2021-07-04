//
//  WeatherRow.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/4/21.
//

import SwiftUI
import KingfisherSwiftUI

struct WeatherRow: View {
    @State var weather: Weather
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15.0) {
                Text("Date: \((weather.date ?? 0).convertToFormat())")
                Text("Average Temperature: \(weather.avgTemparature ?? 0)°C")
                Text("Pressure: \(weather.pressure ?? 0)")
                Text("Humidity: \(weather.humidity ?? 0)%")
                Text("Description: \(weather.avgTemparature ?? 0)°C")
            }.padding(.vertical, 12)
            Spacer()
            KFImage(weather.iconUrl)
                .resizable()
                .frame(width: 70, height: 70)
            
        }
        .listRowBackground(Color.backgroundColor)
        .background(Color.backgroundColor)
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(weather: .init(date: 1, avgTemparature: 1, pressure: 1, humidity: 1, description: "dsdsdsd", iconUrl: URL(string: "")))
    }
}
