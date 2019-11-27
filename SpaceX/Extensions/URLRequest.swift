// SpaceX - URLRequest.swift Created 2019-11-27

import Foundation

extension URLRequest {
    static func videoRequest(_ url: URL?) -> URLRequest? {
        url.flatMap { url -> URLRequest? in
            guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                else { return nil }
            let inline = URLQueryItem.playsInline(true)
            if components.queryItems?.append(inline) == nil {
                components.queryItems = [inline]
            }
            return components.url.map { URLRequest(url: $0) }
        }
    }
}
