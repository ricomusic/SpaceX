// SpaceX - LaunchDetail.swift Created 2019-11-27

import SwiftUI

struct LaunchDetail: View {
    let viewModel: LaunchDetailViewmodel
    init(_ viewmodel: LaunchDetailViewmodel) {
        self.viewModel = viewmodel
    }
    var body: some View {
        List {
            Section {
                viewModel.videoLink.map(WebView.init)
                    .frame(height: .videoHeight)
                Text(viewModel.details).font(.body)
            }
        }
        .navigationBarTitle(viewModel.title)
        .listStyle(GroupedListStyle())
    }
}
