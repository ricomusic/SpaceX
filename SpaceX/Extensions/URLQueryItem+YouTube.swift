// SpaceX - URLQueryItem+YouTube.swift Created 2019-11-27

import Foundation

extension URLQueryItem {
    static func playsInline(_ value: Bool) -> URLQueryItem {
        URLQueryItem(name: "playsinline", value: value ? "1" : "0")
    }
}
