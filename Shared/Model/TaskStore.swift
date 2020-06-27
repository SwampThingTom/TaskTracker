//
//  TaskStore.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/23/20.
//

import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task]
    @Published private(set) var currentTaskID: UUID?
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
    
    func toggleCurrentTask(_ task: Task) {
        let shouldStartNewTask = task.id != currentTaskID
        endCurrentTask()
        
        guard shouldStartNewTask else {
            currentTaskID = nil
            return
        }
        
        startTask(task)
        currentTaskID = task.id
    }
    
    private func startTask(_ task: Task) {
        guard let taskIndex = tasks.firstIndex(where: { task.id == $0.id }) else { return }
        tasks[taskIndex].currentStartTime = Date()
    }

    private func endCurrentTask() {
        guard let taskIndex = tasks.firstIndex(where: { currentTaskID == $0.id }) else { return }
        guard let startTime = tasks[taskIndex].currentStartTime else { return }
        let activeTime = ActiveTime(startTime: startTime, stopTime: Date())
        tasks[taskIndex].activeTimes.append(activeTime)
        tasks[taskIndex].currentStartTime = nil
    }
}

let previewStore = TaskStore(tasks: previewTasks)
