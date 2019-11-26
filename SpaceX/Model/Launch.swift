// SpaceX - Launch.swift Created 2019-11-26

import Foundation

struct Launch {
    let flightNumber: Int?
    let missionName: String? //
    let launchDateUTC: Date? //
    let launchSuccess: Bool?
    let videoLink: URL?
    let details: String?
}

extension Launch: Decodable {
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case launchDateUTC = "launch_date_utc"
        case launchSuccess = "launch_success"
        case videoLink = "links"
        case details
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        flightNumber = try? container.decode(Int.self, forKey: .flightNumber)
        missionName = try? container.decode(String.self, forKey: .missionName)
        launchDateUTC = try? container.decode(Date.self, forKey: .launchDateUTC)
        launchSuccess = try? container.decode(Bool.self, forKey: .launchSuccess)
        details = try? container.decode(String.self, forKey: .details)
        videoLink = try? container.decode(Links.self, forKey: .videoLink).videoLink
    }
}

private struct Links {
    let videoLink: URL
}
extension Links: Decodable {
    enum CodingKeys: String, CodingKey {
        case videoLink = "video_link"
    }
}
