//
//  TaskStore.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/23/20.
//

import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task]
    @Published private(set) var currentTask: Task?
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
    
    func toggleCurrentTask(_ task: Task) {
        let startNewTask = task.id != currentTask?.id
        if var currentTask = currentTask {
            currentTask.currentStartTime = nil
        }
        guard startNewTask else {
            currentTask = nil
            return
        }
        
        guard let taskIndex = tasks.firstIndex(where: { task.id == $0.id }) else { return }
        tasks[taskIndex].currentStartTime = Date()
        currentTask = task
    }
}

let previewStore = TaskStore(tasks: previewTasks)
