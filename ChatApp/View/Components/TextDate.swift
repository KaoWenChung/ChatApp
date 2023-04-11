//
//  TextDate.swift
//  ChatApp
//
//  Created by wyn on 2023/4/10.
//

import SwiftUI

struct TextDate: View {
    let date: Date

    private var isLessThanOneMinute: Bool { date.timeIntervalSinceNow > -60 }
    private var isLessThanOneDay: Bool { date.timeIntervalSinceNow > -60 * 60 * 24 }
    private var isLessThanOneWeek: Bool { date.timeIntervalSinceNow > -60 * 60 * 24 * 7}
    private var isLessThanOneYear: Bool { date.timeIntervalSinceNow > -60 * 60 * 24 * 365}

    var body: some View {
        if isLessThanOneMinute {
            Text(date.formatted(.dateTime.hour().minute().second()))
        } else {
            if isLessThanOneDay {
                Text(date.formatted(.dateTime.hour().minute()))
            } else {
                if isLessThanOneWeek {
                    Text(date.formatted(.dateTime.weekday(.wide).hour().minute()))
                } else {
                    if isLessThanOneYear {
                        Text(date.formatted(.dateTime.month().day()))
                    } else {
                        Text(date.formatted(.dateTime.year().month().day()))
                    }
                }
            }
        }
    }
}

struct TextDate_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            // 1 year ago
            TextDate(date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365))
            // 1 week ago
            TextDate(date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 7))
            // 1 day ago
            TextDate(date: Date(timeIntervalSinceNow: -60 * 60 * 24))
            // 1 hour ago
            TextDate(date: Date(timeIntervalSinceNow: -60 * 60))
            // 1 minute ago
            TextDate(date: Date(timeIntervalSinceNow: -60))
            // Now
            TextDate(date: Date())
        }
    }
}
