//
//  String.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 05/06/21.
//

import Foundation

extension String {

    func toDate(in timeZone: String = TimeZone.current.identifier,
                withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "pt_BT")
        formatter.timeZone = TimeZone(identifier: timeZone)
        return formatter.date(from: self)
    }

}
