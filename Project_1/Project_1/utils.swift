//
//  utils.swift
//  demo_T1000
//
//  Created by user on 9/26/21.
//

import Foundation

class Utils {
    
    static func readInt() -> Int {
        if let number = Int(readLine()!) {
            return number
        }
        print("Invalid input")
        print()
        return -1
    }
    
    static func readFloat() -> Float {
        return Float(readLine()!)!
    }
    
    static func readDouble() -> Double {
        return Double(readLine()!)!
    }
    
    static func readString() -> String {
        return readLine()!
    }
}
