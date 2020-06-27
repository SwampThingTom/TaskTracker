//
//  Task.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/23/20.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var currentStartTime: Date?
    
    var isCurrentTask: Bool {
        return currentStartTime != nil
    }
}

let previewTasks = [
    Task(name: "Watch WWDC"),
    Task(name: "File Upload"),
    Task(name: "Code Reviews"),
    Task(name: "Dev Testing"),
    Task(name: "TAC"),
    Task(name: "TDO"),
    Task(name: "Team Meeting"),
    Task(name: "Learning Time"),
    Task(name: "Indie Time")
]
