// SpaceX - SpaceXAPI.swift Created 2019-11-26

import Combine
import Foundation

struct SpaceXAPI {
    let session: Session
    init(session: Session = URLSession.shared) {
        self.session = session
    }
    func pastLaunches() -> AnyPublisher<[Launch], Error> {
        session.taskPublisher(for: Endpoint.request)
        .decode(type: [Launch].self, decoder: JSONDecoder.launchDecoder())
        .eraseToAnyPublisher()
    }
}
