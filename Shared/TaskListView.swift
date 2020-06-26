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
                    NavigationLink(destination: Text(task.name)) {
                        Text(task.name)
                            .font(.title)
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
