//
//  main.swift
//  CharReplacement
//
//  Created by Astha yadav on 05/01/21.
//

import Foundation


let LAST_CODE_POINT = 122
let FIRST_CODE_POINT = 96
let SMALL_LETTERS_COUNT = 26

print("Enter String: ")
let inputChar:String = readLine() ?? ""
print("Enter increment by: ")
let incrementBy:String = readLine() ?? String(0)


let a = charReplacement(input: inputChar,incrementBy:Int(incrementBy)!)
print("Output: ",a)

func charReplacement(input:String,incrementBy:Int) -> String {
    
    var incrementBy = incrementBy
    incrementBy = incrementBy % SMALL_LETTERS_COUNT
    let ms = NSMutableString()
    let asciiValue = input.compactMap { $0.asciiValue }
    for i in 0..<asciiValue.count {
        
        let n = asciiValue[i]
        let afterAddingCount = UInt8(incrementBy) + n
        
        if afterAddingCount > LAST_CODE_POINT {
            let newCount = ((Int(afterAddingCount) % LAST_CODE_POINT) + FIRST_CODE_POINT)
            let newChar = String(UnicodeScalar(newCount)!)
            ms.append(newChar)
        } else {
            let newChar = String(UnicodeScalar(afterAddingCount))
            ms.append(newChar)
        }
    }

    return ms as String

}

