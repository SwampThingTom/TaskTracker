//
//  ActiveTime.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import Foundation

struct ActiveTime {
    let startTime: Date
    let stopTime: Date
    var duration: TimeInterval {
        stopTime.timeIntervalSince(startTime)
    }
}
