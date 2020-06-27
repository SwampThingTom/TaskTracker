//
//  TaskRow.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

struct TaskRow: View {
    @EnvironmentObject var store: TaskStore
    let task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.name)
                    .font(.title)
                Text(task.totalTimeDisplay)
            }
            Spacer()
            if task.id == store.currentTaskID {
                StopTaskButton(action: toggleCurrentTask(task))
            } else {
                StartTaskButton(action: toggleCurrentTask(task))
            }
        }
    }
    
    func toggleCurrentTask(_ task: Task) -> () -> Void {
        return {
            store.toggleCurrentTask(task)
        }
    }
}

extension Task {
    var totalTimeDisplay: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute ]
        formatter.zeroFormattingBehavior = [ .pad ]
        return formatter.string(from: totalTime) ?? ""
    }
}
