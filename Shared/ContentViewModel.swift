//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Szymon Lorenz on 31/5/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    let rows = [
        ["AC", "", "", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        [".", "0", "", "="]
    ]

    @Published var displayedValue: String = "0"
    
    func action(_ key: String) {
        print("✅", key)
    }
}
