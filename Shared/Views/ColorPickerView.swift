//
//  ColorPickerView.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor: TaskColor
    
    var body: some View {
        VStack {
            HStack {
                colorGroup(TaskColor.color1 ... TaskColor.color4)
            }
            HStack {
                colorGroup(TaskColor.color5 ... TaskColor.color8)
            }
        }
    }
    
    func colorGroup(_ range: ClosedRange<TaskColor>) -> some View {
        ForEach(range) { color in
            ColorSelection(color: color, isSelected: color == selectedColor, onTap: select)
        }
    }
    
    func select(color: TaskColor) {
        selectedColor = color
    }
}

struct ColorSelection: View {
    let color: TaskColor
    let isSelected: Bool
    var onTap: (TaskColor) -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color.color)
            .frame(width: 50, height: 50)
            .padding(10)
            .overlay(
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .opacity(isSelected ? 1.0 : 0.0)
            )
            .onTapGesture {
                onTap(color)
            }
    }
}

extension TaskColor: Identifiable {
    var id: Int { self.rawValue }
}

extension TaskColor: Strideable {
    typealias Stride = Int
    
    func distance(to other: TaskColor) -> Int {
        Stride(other.rawValue) - Stride(self.rawValue)
    }
    
    func advanced(by n: Int) -> TaskColor {
        TaskColor(rawValue: self.rawValue + n)!
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorPickerView(selectedColor: .constant(TaskColor.color1))
                .preferredColorScheme(.light)
            ColorPickerView(selectedColor: .constant(TaskColor.color1))
                .preferredColorScheme(.dark)
        }
    }
}
