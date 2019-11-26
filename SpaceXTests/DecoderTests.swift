// SpaceX - SpaceXTests.swift Created 2019-11-26

import XCTest
@testable import SpaceX

class SpaceXTests: XCTestCase {
    func testDecoder() throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let launchDate = try XCTUnwrap(dateFormatter.date(from: "2006-03-24T22:30:00.000Z"))
        let testBundle = Bundle(for: type(of: self))
        let fileURL = try XCTUnwrap(testBundle.url(forResource: "launch", withExtension: "json"))

        let jsonData = try Data(contentsOf: fileURL)

        let decoder = JSONDecoder.launchDecoder()

        let launch = try decoder.decode(Launch.self, from: jsonData)

        XCTAssertEqual(1, launch.flightNumber)
        XCTAssertEqual("FalconSat", launch.missionName)
        XCTAssertEqual(launchDate, launch.launchDateUTC)
        let launchSuccess = try XCTUnwrap(launch.launchSuccess)
        XCTAssertFalse(launchSuccess)
        XCTAssertEqual("https://www.youtube.com/watch?v=0a_00nJ_Y88", launch.videoLink?.absoluteString)
        XCTAssertEqual("Engine failure at 33 seconds and loss of vehicle", launch.details)
    }
}
