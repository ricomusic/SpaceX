// SpaceX - LaunchDetailViewmodel.swift Created 2019-11-27

import Combine
import SwiftUI

class LaunchDetailViewmodel: ObservableObject {
    private let launch: Launch
    private let dateFormatter: DateFormatter

    init(launch: Launch, dateFormatter: DateFormatter = DateFormatter()) {
        self.launch = launch
        self.dateFormatter = dateFormatter
        self.dateFormatter.dateStyle = .short
    }

    var flightNumber: String { launch.flightNumber.map(String.init) ?? "" }
    var missionName: String { launch.missionName ?? "" }
    var date: String { launch.launchDateUTC.map(dateFormatter.string(from:)) ?? "" }
    var launchSuccess: Bool? { launch.launchSuccess }
    var videoLink: String { "Yeah" }
    var details: String { launch.details ?? "" }

}
