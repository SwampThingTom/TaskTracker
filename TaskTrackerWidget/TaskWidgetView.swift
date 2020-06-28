//
//  TaskWidgetView.swift
//  TaskTrackerWidgetExtension
//
//  Created by Tom Aylesworth on 6/28/20.
//

import SwiftUI

struct TaskWidgetView: View {
    var task: Task?
    
    var body: some View {
        VStack {
            Text(task != nil ? task!.name : "No active task")
                .foregroundColor(task != nil ? task!.color.color : .primary)
            if task != nil {
                CurrentTaskView(currentStartTime: task!.currentStartTime,
                                backgroundColor: task!.color.color,
                                imageSize: 30)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
    }
}

func totalTimeDisplay(_ totalTime: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .positional
    formatter.allowedUnits = [ .hour, .minute ]
    formatter.zeroFormattingBehavior = [ .pad ]
    return formatter.string(from: totalTime) ?? ""
}

func elapsedTimeDisplay(_ elapsedTime: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .positional
    formatter.allowedUnits = [ .hour, .minute ]
    formatter.zeroFormattingBehavior = [ .pad ]
    return formatter.string(from: elapsedTime) ?? ""
}

struct CurrentTaskView: View {
    let currentStartTime: Date?
    let backgroundColor: Color
    let imageSize: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            if currentStartTime != nil {
                Text(currentStartTime!, style: .timer)
                    .foregroundColor(.white)
            }
            Image(systemName: "clock")
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(5)
        .background(backgroundColor)
        .cornerRadius(15)
    }
}

extension TimeInterval {
    var roundedToHour: TimeInterval {
        let secondsPerHour: TimeInterval = 60 * 60
        let hours = self / secondsPerHour
        return hours.rounded() * secondsPerHour
    }
}
