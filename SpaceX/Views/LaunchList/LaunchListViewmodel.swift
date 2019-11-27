// SpaceX - LaunchListViewmodel.swift Created 2019-11-26

import Combine
import SwiftUI

class LaunchListViewmodel: ObservableObject, Identifiable {
    private var disposables = Set<AnyCancellable>()

    @Published var launches: [LaunchListRowViewmodel] = []
    init(api: SpaceXAPI = SpaceXAPI()) {
        api.pastLaunches()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveValue: { stuff in
                let dateFormatter = DateFormatter()
                self.launches = stuff.map {
                    LaunchListRowViewmodel(launch: $0, dateFormatter: dateFormatter)
                }
            })
            .store(in: &disposables)
    }
    let title = "Dynamo SpaceX"
}
