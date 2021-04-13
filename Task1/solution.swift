//
//  solution.swift
//  TestStrings
//
//  Created by Andrey Kindyaev on 8.04.21.
//

import Foundation

let any = Character("?")
let anyReplacement = Character("a")
let no = "NO"

public func solution(_ S : inout String) -> String {
    guard S.count > 0 else {
        return no
    }
    var chars = Array(S)
    let middle = (chars.count + 1).quotientAndRemainder(dividingBy: 2).quotient
    for leftIndex in 0..<middle {
        let rightIndex = chars.count - 1 - leftIndex
        if chars[leftIndex] == any, chars[rightIndex] == any {
            chars[leftIndex] = anyReplacement
            chars[rightIndex] = anyReplacement
            continue
        }
        if chars[leftIndex] == any {
            chars[leftIndex] = chars[rightIndex]
            continue
        }
        if chars[rightIndex] == any {
            chars[rightIndex] = chars[leftIndex]
            continue
        }
        if chars[leftIndex] != chars[rightIndex] {
            return no
        }
    }
    return String(chars)
}
