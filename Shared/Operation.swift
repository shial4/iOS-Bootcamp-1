//
//  Operation.swift
//  Calculator
//
//  Created by Szymon Lorenz on 31/5/21.
//

import Foundation

enum Operation {
    case addition
    case subtraction
    case multiplication
    case division
    case decimalPoint
    case result
    case allClear
    case number(Int)
    
    var isValueType: Bool {
        switch self {
        case .number, .decimalPoint:
            return true
        default:
            return false
        }
    }
    
    var asString: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "*"
        case .division:
            return "\\"
        case .number(let value):
            return "\(value)"
        case .decimalPoint:
            return "."
        default:
            return "Error"
        }
    }
    
    init?(_ key: String) {
        switch key {
        case "+":
            self = .addition
        case "−":
            self = .subtraction
        case "×":
            self = .multiplication
        case "÷":
            self = .division
        case ".":
            self = .decimalPoint
        case "=":
            self = .result
        case "AC":
            self = .allClear
        case let key where Int(key) != nil:
            self = .number(Int(key)!)
        default:
            return nil
        }
    }
}
