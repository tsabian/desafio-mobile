//
//  String.swift
//  TmdbMovieware
//
//  Created by Tiago Oliveira on 05/06/21.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
                locale: Locale = Locale(identifier: "pt_BR"),
                timezone: TimeZone = TimeZone.current) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = timezone
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
