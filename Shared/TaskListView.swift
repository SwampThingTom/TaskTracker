//
//  TaskListView.swift
//  Shared
//
//  Created by Tom Aylesworth on 6/23/20.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var store: TaskStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.tasks) { task in
                    HStack {
                        Text(task.name)
                            .font(.title)
                        Spacer()
                        if task.id == store.currentTask?.id {
                            Button(action: toggleCurrentTask(task)) {
                                HStack {
                                    Text("CURRENT")
                                    Image(systemName: "clock")
                                }
                            }
                        } else {
                            Button(action: toggleCurrentTask(task)) {
                                Image(systemName: "clock")
                            }
                        }
                    }
                }
                .onMove(perform: moveTasks)
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Tasks")
            .navigationBarItems(leading: Button("Add", action: addTask),
                                trailing: EditButton())
        }
    }
    
    func addTask() {
        withAnimation {
            store.tasks.append(
                Task(name: "New Task")
            )
        }
    }
    
    func moveTasks(from: IndexSet, to: Int) {
        withAnimation {
            store.tasks.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteTasks(offsets: IndexSet) {
        withAnimation {
            store.tasks.remove(atOffsets: offsets)
        }
    }
    
    func toggleCurrentTask(_ task: Task) -> () -> Void {
        return {
            store.toggleCurrentTask(task)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskListView(store: previewStore)
                .preferredColorScheme(.light)
            TaskListView(store: previewStore)
                .preferredColorScheme(.dark)
        }
    }
}
