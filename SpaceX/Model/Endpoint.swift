// SpaceX - Endpoint.swift Created 2019-11-26

import Foundation

struct Endpoint {
    private enum SpaceXURL {
        static let scheme = "https"
        static let host = "api.spacexdata.com"
        static let path = "/v3/launches/past"
        static var components: URLComponents {
            var components = URLComponents()
            components.scheme = SpaceXURL.scheme
            components.host = SpaceXURL.host
            components.path = SpaceXURL.path
            return components
        }
    }
    static var request: URLRequest {
        guard let url = SpaceXURL.components.url else { fatalError("Failed composing URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
