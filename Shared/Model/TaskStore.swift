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
    @Published private(set) var currentTaskElapsedTime: TimeInterval = 0
    @Published private(set) var currentTaskTotalTime: TimeInterval = 0
    
    private lazy var currentTaskTimer = TaskTimer()
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
        currentTaskID = tasks.first { $0.currentStartTime != nil }?.id
        currentTaskTimer.onUpdate = onTimerUpdate
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
        currentTaskElapsedTime = 0
        currentTaskTotalTime = tasks[taskIndex].totalTime
        currentTaskTimer.start()
    }

    private func endCurrentTask() {
        currentTaskTimer.stop()
        guard let taskIndex = tasks.firstIndex(where: { currentTaskID == $0.id }) else { return }
        guard let startTime = tasks[taskIndex].currentStartTime else { return }
        let activeTime = ActiveTime(startTime: startTime, stopTime: Date())
        tasks[taskIndex].activeTimes.append(activeTime)
        tasks[taskIndex].currentStartTime = nil
    }
    
    private func onTimerUpdate() {
        guard let taskIndex = tasks.firstIndex(where: { currentTaskID == $0.id }) else { return }
        guard let startTime = tasks[taskIndex].currentStartTime else { return }
        currentTaskElapsedTime = Date().timeIntervalSince(startTime)
        currentTaskTotalTime = tasks[taskIndex].totalTime + currentTaskElapsedTime
    }
}

let previewStore = TaskStore(tasks: previewTasks)
