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
        launch.missionName ?? ""
    }
    var flightNumber: String {
        launch.flightNumber.map(String.init) ?? ""
    }
    var date: String {
        launch.launchDateUTC.map(dateFormatter.string(from:)) ?? ""
    }
}
