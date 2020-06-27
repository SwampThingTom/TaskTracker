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
            RoundedRectangle(cornerRadius: 10)
                .fill(task.color.color)
                .frame(width: 60, height: 60)
                .overlay(
                    Text(task.totalTimeDisplay)
                        .foregroundColor(.white)
                )
            Text(task.name)
            Spacer()
            if task.id == store.currentTaskID {
                StopTaskButton(backgroundColor: task.color.color,
                               imageSize: 30,
                               action: toggleCurrentTask(task))
            } else {
                StartTaskButton(imageSize: 30, action: toggleCurrentTask(task))
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

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskRow(task: previewTasks.first!)
                .environmentObject(TaskStore())
                .preferredColorScheme(.light)
            TaskRow(task: previewTasks.first!)
                .environmentObject(TaskStore())
                .preferredColorScheme(.dark)
        }
    }
}
