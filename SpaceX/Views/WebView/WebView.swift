// SpaceX - WebView.swift Created 2019-11-27

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let url: URL
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        return WKWebView(frame: .zero, configuration: config)
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        _ = url.embedCode.map {
            uiView.loadHTMLString($0, baseURL: nil)
        }
    }
}
