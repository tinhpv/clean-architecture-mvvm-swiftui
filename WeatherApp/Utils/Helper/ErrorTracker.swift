//
//  ErrorTracker.swift
//  WeatherApp
//
//  Created by tinhpv4 on 7/5/21.
//

import Combine

public typealias ErrorTracker = PassthroughSubject<Error, Never>

extension Publisher where Failure: Error {
    public func trackError(_ errorTracker: ErrorTracker) -> AnyPublisher<Output, Failure> {
        return handleEvents(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                errorTracker.send(error)
            }
        })
        .eraseToAnyPublisher()
    }
}
