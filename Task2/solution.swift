//
//  solution.swift
//
//  Created by Andrey Kindyaev on 8.04.21.
//

import Foundation

public func solution(_ A : inout [String]) -> Int {
    let strings = A.filter { Set($0).count == $0.count }
    guard !strings.isEmpty else {
        return 0
    }
    let maxAvailableLength = strings.reduce(0, { $0 + $1.count })
    // use N bits mask for concatenation combination
    // N in range [1..8] thus UInt8 is enough
    let maxBitCombination = UInt8(1<<strings.count - 1)
    var maxLength = 0
    main: for bitCombination in 1...maxBitCombination {
        var restOfCombination = bitCombination
        var index = 0
        var string = ""
        while restOfCombination != 0 && index < strings.count {
            let quotientAndRemainder = restOfCombination.quotientAndRemainder(dividingBy: 2)
            restOfCombination = quotientAndRemainder.quotient
            if quotientAndRemainder.remainder == 1 {
                string += strings[index]
                guard string.count == Set(string).count else {
                    continue main
                }
            }
            index += 1
        }
        if string.count > maxLength {
            if string.count == maxAvailableLength {
                return maxAvailableLength
            }
            maxLength = string.count
        }
    }
    return maxLength
}
