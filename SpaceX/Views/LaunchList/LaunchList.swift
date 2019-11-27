// SpaceX - LaunchList.swift Created 2019-11-26

import SwiftUI

struct LaunchList: View {
    @ObservedObject var viewModel: LaunchListViewmodel

    init() {
        self.viewModel = LaunchListViewmodel()
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.launches, id: \.flightNumber) { launch in
                    LaunchListRow(launch)
                }
            }.navigationBarTitle(viewModel.title)
        }
    }
}

struct LaunchListPreviews: PreviewProvider {
    static var previews: some View {
        LaunchList()
    }
}
