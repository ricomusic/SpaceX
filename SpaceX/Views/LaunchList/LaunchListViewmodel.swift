// SpaceX - LaunchListViewmodel.swift Created 2019-11-26

import Combine
import SwiftUI

class LaunchListViewmodel: ObservableObject, Identifiable {
    private let api: SpaceXAPI
    private var timer: Timer?
    private var disposables = Set<AnyCancellable>()

    @Published var launches: [LaunchListRowViewmodel] = []
    init(api: SpaceXAPI = SpaceXAPI(), fetchInterval: TimeInterval? = nil) {
        self.api = api
        fetchInterval.map(startFetching(_:))
        fetchLaunches()
    }
    let title = String.appTitle
    deinit {
        disposables.forEach {
            $0.cancel()
        }
    }
    
    func startFetching(_ interval: TimeInterval) {
        timer = Timer.scheduledTimer(withTimeInterval: interval,
                                     repeats: true,
                                     block: { [weak self] _ in
                                        self?.fetchLaunches() })
    }
    func fetchLaunches() {
        api.pastLaunches()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveValue: { [weak self] stuff in
                let dateFormatter = DateFormatter()
                self?.launches = stuff.map {
                    LaunchListRowViewmodel(launch: $0, dateFormatter: dateFormatter)
                }
            })
            .store(in: &disposables)
    }
}
