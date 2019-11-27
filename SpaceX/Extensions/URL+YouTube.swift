// SpaceX - URL+YouTube.swift Created 2019-11-27

import Foundation

extension URL {
    var embedCode: String? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false),
            let videoId = components.queryItems?.first(where: { item in
                item.name == "v"
            })?.value
            else { return nil }
        components.path = "/embed/\(videoId)"
        components.queryItems = [.playsInline(true)]
        return components.url
            .map(embedCode)
    }
    private func embedCode(_ url: URL) -> String {
        return """
        <iframe width="100%" height="100%"\
        src="\(url)" \
        frameborder="0"\
        allow="accelerometer;\
        autoplay;\
        encrypted-media;\
        gyroscope;\
        picture-in-picture"\
        allowfullscreen></iframe>
        """
    }
}
