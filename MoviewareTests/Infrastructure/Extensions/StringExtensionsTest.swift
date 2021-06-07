//
//  StringExtensionsTest.swift
//  MoviewareTests
//
//  Created by Tiago Oliveira on 05/06/21.
//

import XCTest
@testable import TmdbMovieware

final class StringExtensionsTest: XCTestCase {

    func testConvertToDateShouldBySuccess() {
        var expectedDate = DateComponents()
        let calendar = Calendar(identifier: .gregorian)
        expectedDate.calendar = calendar
        expectedDate.day = 09
        expectedDate.year = 2021
        expectedDate.month = 01
        expectedDate.hour = 20
        expectedDate.minute = 01
        expectedDate.second = 05
        
        var date = "2021-01-09".toDate(withFormat: "yyyy-MM-dd")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.year, calendar.component(.year, from: date))
            XCTAssertEqual(expectedDate.month, calendar.component(.month, from: date))
            XCTAssertEqual(expectedDate.day, calendar.component(.day, from: date))
        }

        date = "2021-01-09 20:01:05".toDate(withFormat: "yyyy-MM-dd HH:mm:ss")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.year, calendar.component(.year, from: date))
            XCTAssertEqual(expectedDate.month, calendar.component(.month, from: date))
            XCTAssertEqual(expectedDate.day, calendar.component(.day, from: date))
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }

        date = "2021-01-09T20:01:05".toDate(withFormat: "yyyy-MM-dd'T'HH:mm:ss")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.year, calendar.component(.year, from: date))
            XCTAssertEqual(expectedDate.month, calendar.component(.month, from: date))
            XCTAssertEqual(expectedDate.day, calendar.component(.day, from: date))
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }

        date = "2021-01-09 20:01:05 UTC".toDate(withFormat: "yyyy-MM-dd HH:mm:ss ZZZ", timezone: TimeZone(identifier: "UTC")!)
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.year, calendar.component(.year, from: date))
            XCTAssertEqual(expectedDate.month, calendar.component(.month, from: date))
            XCTAssertEqual(expectedDate.day, calendar.component(.day, from: date))
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }
        
        date = "20:01:05 UTC".toDate(withFormat: "HH:mm:ss ZZZ")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }
        date = "20:01:05".toDate(withFormat: "HH:mm:ss")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }
    }
}
