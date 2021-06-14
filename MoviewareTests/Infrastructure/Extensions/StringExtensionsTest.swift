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
        
        guard let timeZone = TimeZone(abbreviation: "UTC") else {
            XCTFail("Time zone UTC should cannot by null")
            return
        }
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = timeZone
        
        let expectedDate = DateComponents(calendar: calendar, timeZone: timeZone, year: 2021, month: 1,
                                          day: 9, hour: 20, minute: 1, second: 5)
                
        var date = "2021-01-09".toDate(withFormat: "yyyy-MM-dd")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.year, calendar.component(.year, from: date))
            XCTAssertEqual(expectedDate.month, calendar.component(.month, from: date))
            XCTAssertEqual(expectedDate.day, calendar.component(.day, from: date))
        }

        date = "2021-01-09 20:01:05".toDate(in: "UTC", withFormat: "yyyy-MM-dd HH:mm:ss")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.year, calendar.component(.year, from: date))
            XCTAssertEqual(expectedDate.month, calendar.component(.month, from: date))
            XCTAssertEqual(expectedDate.day, calendar.component(.day, from: date))
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }

        date = "2021-01-09T20:01:05".toDate(in: "UTC", withFormat: "yyyy-MM-dd'T'HH:mm:ss")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.year, calendar.component(.year, from: date))
            XCTAssertEqual(expectedDate.month, calendar.component(.month, from: date))
            XCTAssertEqual(expectedDate.day, calendar.component(.day, from: date))
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }

        date = "2021-01-09 20:01:05 UTC".toDate(in: "UTC", withFormat: "yyyy-MM-dd HH:mm:ss zzz")
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
        date = "20:01:05".toDate(in: "UTC", withFormat: "HH:mm:ss")
        XCTAssertNotNil(date)
        if let date = date {
            XCTAssertEqual(expectedDate.hour, calendar.component(.hour, from: date))
            XCTAssertEqual(expectedDate.minute, calendar.component(.minute, from: date))
            XCTAssertEqual(expectedDate.second, calendar.component(.second, from: date))
        }
    }
}
