// SpaceX - JSONDecoder.swift Created 2019-11-26

import Foundation

extension JSONDecoder {
    static func launchDecoder(dateFormatter: DateFormatter = DateFormatter()) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            if let date = dateFormatter.date(from: dateString) { return date }
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Cannot decode date string \(dateString)")
        })
        return decoder
    }
}
