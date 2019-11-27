// SpaceX - LaunchListRow.swift Created 2019-11-27

import SwiftUI

struct LaunchListRow: View {
    let viewModel: LaunchListRowViewmodel

    init(_ viewModel: LaunchListRowViewmodel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationLink(destination: viewModel.destination) {
            HStack {
                Text(viewModel.flightNumber)
                Text(viewModel.missionName)
                Spacer()
                Text(viewModel.date)
            }
        }
    }
}
