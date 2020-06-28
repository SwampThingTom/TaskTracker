//
//  TaskTimer.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import Foundation

class TaskTimer {
    private let queue = DispatchQueue(label: "tasktimer.timer")
    private lazy var timer: DispatchSourceTimer = {
        let timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.strict,
                                                   queue: self.queue)
        timer.setEventHandler { [weak self] in
            DispatchQueue.main.async {
                self?.onUpdate?()
            }
        }
        let interval = DispatchTimeInterval.seconds(1)
        timer.schedule(deadline: .now() + interval, repeating: interval)
        return timer
    }()
    
    private var isRunning = false
    
    var onUpdate: (() -> Void)?
    
    func start() {
        guard !isRunning else { return }
        isRunning = true
        self.timer.resume()
    }
    
    func stop() {
        guard isRunning else { return }
        isRunning = false
        self.timer.suspend()
    }
}
