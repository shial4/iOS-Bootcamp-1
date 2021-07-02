//
//  ContentViewModel.swift
//  Calculator
//
//  Created by Szymon Lorenz on 31/5/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    let rows = [
        ["C", "AC", "", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        [".", "0", "", "="]
    ]
    var calculator: Calculator = Calculator()

    @Published var displayedValue: String = "0"
    
    func action(_ key: String) {
        guard let operation = Operation(key) else { return }
        switch operation {
        case .result:
            displayedValue = "\(calculator.conclude())"
        case .clear:
            calculator.operations.removeLast()
            displayedValue = calculator.lastOperationAsString()
        case .allClear:
            calculator.operations.removeAll()
            displayedValue = "0"
        case .number, .decimalPoint:
            if calculator.operations.isEmpty {
                calculator.operations.append([operation])
            } else {
                let operations = calculator.operations.removeLast()
                if operations.first?.isValueType == true {
                    calculator.operations.append(operations + [operation])
                } else {
                    calculator.operations.append(contentsOf:[operations, [operation]])
                }
            }
            displayedValue = calculator.lastOperationAsString()
        default:
            calculator.operations.append([operation])
            displayedValue = operation.asString
        }
    }
}
