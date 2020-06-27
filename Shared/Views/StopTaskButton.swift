//
//  StopTaskButton.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

struct StopTaskButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text("CURRENT")
                Image(systemName: "clock")
            }
            .padding(5)
            .background(Color.orange)
            .cornerRadius(40)
        }
    }
}
