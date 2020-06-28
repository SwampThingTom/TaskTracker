//
//  TaskTrackerWidget.swift
//  TaskTrackerWidget
//
//  Created by Tom Aylesworth on 6/28/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), task: widgetPreviewTask)
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date(), task: widgetPreviewTask)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    let task: Task
}

struct PlaceholderView : View {
    var body: some View {
        TaskWidgetView(task: widgetPreviewTask)
            // TODO: This does not yet work
            // https://developer.apple.com/forums/thread/650564?answerId=615048022#615048022
            // .isPlaceholder(true)
    }
}

struct TaskTrackerWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        TaskWidgetView(task: entry.task)
    }
}

@main
struct TaskTrackerWidget: Widget {
    private let kind: String = "TaskTrackerWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            TaskTrackerWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Task Tracker")
        .description("Keep track of your current task.")
        .supportedFamilies([.systemSmall])
    }
}

struct TaskTrackerWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskWidgetView(task: widgetPreviewTask)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            TaskWidgetView(task: nil)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}

let previewTaskStartTime = Date().addingTimeInterval(-90*60)
let widgetPreviewTask = Task(name: "Watch WWDC",
                             color: .color1,
                             currentStartTime: previewTaskStartTime,
                             activeTimes: [])
