// SpaceX - LaunchListRowViewmodel.swift Created 2019-11-27

import Combine
import SwiftUI

class LaunchListRowViewmodel: ObservableObject {
    private let launch: Launch
    private let dateFormatter: DateFormatter

    init(launch: Launch,
         dateFormatter: DateFormatter = DateFormatter()) {
        self.launch = launch
        self.dateFormatter = dateFormatter
        self.dateFormatter.dateStyle = .medium
    }
    var missionName: String {
        launch.missionName ?? .empty
    }
    var flightNumber: String {
        launch.flightNumber.map(String.init) ?? .empty
    }
    var date: String {
        launch.launchDateUTC.map(dateFormatter.string(from:)) ?? .empty
    }
    var destination: some View {
        let viewmodel = LaunchDetailViewmodel(launch: launch)
        return LaunchDetail(viewmodel)
    }
}
