//
//  Integer+Ext.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import Foundation

extension Int {
    func convertToFormat() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "E, dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
}
