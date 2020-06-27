//
//  Task.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/23/20.
//

import Foundation

enum TaskColor: Int, CaseIterable {
    case color1, color2, color3, color4, color5, color6, color7, color8
}

struct Task: Identifiable {
    let id = UUID()
    let name: String
    let color: TaskColor
    
    var currentStartTime: Date?
    var activeTimes: [ActiveTime] = []
    
    var totalTime: TimeInterval {
        activeTimes.reduce(0) { (accumulator, time) in
            accumulator + time.duration
        }
    }
}

let previewTasks = [
    Task(name: "Watch WWDC", color: .color1),
    Task(name: "File Upload", color: .color2),
    Task(name: "Code Reviews", color: .color3),
    Task(name: "Dev Testing", color: .color4),
    Task(name: "TAC", color: .color5),
    Task(name: "TDO", color: .color6),
    Task(name: "Team Meeting", color: .color7),
    Task(name: "Learning Time", color: .color8),
    Task(name: "Indie Time", color: .color1)
]
