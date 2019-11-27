// SpaceX - LaunchDetail.swift Created 2019-11-27

import SwiftUI

struct LaunchDetail: View {
    let viewModel: LaunchDetailViewmodel
    init(_ viewmodel: LaunchDetailViewmodel) {
        self.viewModel = viewmodel
    }
    var body: some View {
        VStack {
            viewModel.videoRequest.map(WebView.init)
                .frame(height: 300)
            VStack(alignment: .center) {
                Text(viewModel.missionName).font(.title)
                Text(viewModel.date).font(.caption)
            }
            Text(viewModel.details).font(.body)
            Spacer()
        }
        .padding()
    }
}
