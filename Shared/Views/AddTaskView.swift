//
//  AddTaskView.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentation
    @State var taskName = ""
    @State var color = TaskColor.color1
    let onAdd: (Task) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("New task...", text: $taskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(EdgeInsets(top: 20, leading: 8, bottom: 8, trailing: 8))
                ColorPickerView(selectedColor: $color)
                Spacer()
            }
            .navigationBarTitle("Add Task", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel", action: cancel),
                                trailing: Button("Add", action: add))
        }
    }
    
    func add() {
        let task = Task(name: taskName, color: color)
        onAdd(task)
        self.presentation.wrappedValue.dismiss()
    }
    
    func cancel() {
        self.presentation.wrappedValue.dismiss()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddTaskView(onAdd: { task in })
                .preferredColorScheme(.light)
            AddTaskView(onAdd: { task in })
                .preferredColorScheme(.dark)
        }
    }
}
