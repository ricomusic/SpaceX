// SpaceX - Session.swift Created 2019-11-26

import Combine
import Foundation

protocol Session {
    func taskPublisher(for request: URLRequest) -> AnyPublisher<Data, Error>
}
