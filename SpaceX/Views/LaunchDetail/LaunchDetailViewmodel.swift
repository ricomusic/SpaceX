// SpaceX - LaunchDetailViewmodel.swift Created 2019-11-27

import Combine
import SwiftUI

class LaunchDetailViewmodel: ObservableObject {
    private let launch: Launch

    init(launch: Launch) {
        self.launch = launch
    }

    var details: String { launch.details ?? "No details available" }
    var videoRequest: URLRequest? {
        launch.videoLink.flatMap(URLRequest.videoRequest(_:))
    }
    var title: String { launch.missionName ?? "" }
}
