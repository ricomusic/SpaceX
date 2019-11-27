// SpaceX - WebView.swift Created 2019-11-27

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let request: URLRequest
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        return WKWebView(frame: .zero, configuration: config)
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        uiView.load(request)
    }
}
