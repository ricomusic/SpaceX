// SpaceX - URLSession+Session.swift Created 2019-11-26

import Combine
import Foundation

extension URLSession: Session {
    func taskPublisher(for request: URLRequest) -> AnyPublisher<Data, Error> {
        return dataTaskPublisher(for: request)
            .map { $0.data }
            .mapError {
                return $0 as Error
        }
        .eraseToAnyPublisher()
    }
}
