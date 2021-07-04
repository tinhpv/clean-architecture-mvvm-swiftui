//
//  AlertMessage.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/5/21.
//

import Combine

struct AlertMessage {
    var title: String = ""
    var message: String = ""
    var isShowing: Bool = false
    
    init(title: String, message: String, isShowing: Bool) {
        self.title = title
        self.message = message
        self.isShowing = isShowing
    }
    
    init() {
        
    }
}



extension AlertMessage {  // swiftlint:disable:this no_extension_access_modifier
    init(error: ApiError?) {
        self.title = "Error"
        self.message = error?.localizedMessage ?? ""
        self.isShowing = !message.isEmpty
    }
}
