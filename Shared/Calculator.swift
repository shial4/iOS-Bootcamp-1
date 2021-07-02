//
//  Calculator.swift
//  Calculator
//
//  Created by Szymon Lorenz on 31/5/21.
//

import Foundation

extension Double {
    var isInteger: Bool {
        floor(self) == self
    }
}

class Calculator {
    var operations: [[Operation]] = []
    
    /// Compute result in consecutive order.
    /// Do not respect operation priority here.
    /// Assume user thinks as they are computed on the go every time they perform operation
    /// - Returns: Concluded operation result
    func conclude() -> Any {
        var result: Double = 0
        var nextOperation: Operation?
        operations.forEach { operations in
            guard let lastOperation = operations.last else { return }
            if lastOperation.isValueType == true {
                let stringValue = operations.reduce("") { $0 + $1.asString }
                if let next = nextOperation {
                    result = performOperation(next, lhs: result, rhs: Double(stringValue) ?? 0)
                    nextOperation = nil
                } else {
                    result = Double(stringValue) ?? 0
                }
            } else {
                nextOperation = lastOperation
            }
            
        }
        if result.isInteger {
            return Int(result)
        } else {
            return result
        }
    }
    
    func lastOperationAsString() -> String {
        guard let lastOperation = operations.last, lastOperation.first?.isValueType == true else { return "" }
        return lastOperation.reduce("") { $0 + $1.asString }
    }
    
    func performOperation(_ operation: Operation, lhs: Double, rhs: Double) -> Double {
        switch operation {
        case .addition:
            return lhs + rhs
        case .subtraction:
            return lhs - rhs
        case .multiplication:
            return lhs * rhs
        case .division where rhs != 0:
            return lhs / rhs
        default:
            return 0
        }
    }
}
