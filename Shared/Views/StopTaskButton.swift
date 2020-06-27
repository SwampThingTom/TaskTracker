//
//  StopTaskButton.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

struct StopTaskButton: View {
    let backgroundColor: Color
    let imageSize: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text("CURRENT")
                    .foregroundColor(.white)
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(.white)
            }
            .padding(5)
            .background(backgroundColor)
            .cornerRadius(40)
        }
    }
}
