//
//  Helper.swift
//  SwiftUI_Covid
//
//  Created by Kishan Nakum on 08/09/20.
//  Copyright © 2020 Kishan Nakum. All rights reserved.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
}

let icons = ["01", "02","03","04"]
let instructions = ["Sanitise hands","Wash your hands" , "Wear Mask" ,"Avoid Handsake"]

struct AppColors {
    static let bgGradient1 = "#D7E1EC"
    static let bgGradient2 = "#FFFFFF"
    static let bgGradient3 = "#ff758c"
    static let bgGradient4 = "#ff7eb3"
    static let bgGradient5 = "#36D1DC"
    static let bgGradient6 = "#5B86E5"
    static let bgGradient7 = "#fdfbfb"
    static let bgGradient8 = "#ebedee"
}
