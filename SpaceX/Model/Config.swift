// SpaceX - Config.swift Created 2019-11-27

import UIKit

extension TimeInterval {
    static var refreshRate: TimeInterval? = 60
}

extension CGFloat {
    static var videoHeight: CGFloat = 300
}

extension String {
    static var noDetails = "No details available"
    static var empty = ""
    static var appTitle = "Dynamo SpaceX"
    static var utcDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static func dateParseError(_ dateString: String) -> String {
        "Cannot decode date string \(dateString)"
    }
}
