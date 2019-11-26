// SpaceX - API.swift Created 2019-11-26

import Foundation

struct Endpoint {
    private enum SpaceXAPI {
        static let scheme = "https"
        static let host = "api.spacexdata.com"
        static let path = "/v3/launches/past"
        static var components: URLComponents {
            var components = URLComponents()
            components.scheme = SpaceXAPI.scheme
            components.host = SpaceXAPI.host
            components.path = SpaceXAPI.path
            return components
        }
    }
    static var request: URLRequest {
        guard let url = SpaceXAPI.components.url else { fatalError("Failed composing URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
