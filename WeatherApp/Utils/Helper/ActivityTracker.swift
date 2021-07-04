//
//  ActivityTracker.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/5/21.
//

import Combine
import UIKit

public typealias ActivityTracker = CurrentValueSubject<Bool, Never>

extension Publisher where Failure: Error {
    public func trackActivity(_ activityTracker: ActivityTracker) -> AnyPublisher<Output, Failure> {
        return handleEvents(receiveSubscription: { _ in
            activityTracker.send(true)
        }, receiveCompletion: { _ in
            activityTracker.send(false)
        })
        .eraseToAnyPublisher()
    }
}

