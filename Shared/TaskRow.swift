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
            Text(task.name)
                .font(.title)
            Spacer()
            if task.id == store.currentTask?.id {
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
