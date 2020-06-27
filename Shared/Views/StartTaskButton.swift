//
//  StartTaskButton.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

struct StartTaskButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "clock")
        }
    }
}