//
//  TaskTrackerApp.swift
//  Shared
//
//  Created by Tom Aylesworth on 6/23/20.
//

import SwiftUI

@main
struct TaskTrackerApp: App {
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environmentObject(TaskStore())
        }
    }
}
