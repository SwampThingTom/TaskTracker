//
//  TaskColor+SwiftUIColor.swift
//  Task Tracker
//
//  Created by Tom Aylesworth on 6/27/20.
//

import SwiftUI

extension TaskColor {
    var color: Color {
        switch self {
        case .color1: return Color.blue
        case .color2: return Color.gray
        case .color3: return Color.green
        case .color4: return Color.orange
        case .color5: return Color.pink
        case .color6: return Color.purple
        case .color7: return Color.red
        case .color8: return Color.yellow
        }
    }
}
