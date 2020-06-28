//
//  ToggleTaskButton.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

struct ToggleTaskButton: View {
    let elapsedTimeDisplay: String?
    let backgroundColor: Color
    let imageSize: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if elapsedTimeDisplay != nil {
                    // LATER: Try to get `style: .timer` working
                    // https://developer.apple.com/documentation/swiftui/text/datestyle/timer
                    Text(elapsedTimeDisplay!)
                        .foregroundColor(.white)
                }
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(elapsedTimeDisplay != nil ? .white : .primary)
            }
            .padding(5)
            .background(elapsedTimeDisplay != nil ? backgroundColor : .clear)
            .cornerRadius(40)
        }
    }
}
