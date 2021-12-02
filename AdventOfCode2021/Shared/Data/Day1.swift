//
//  Day1.swift
//  AdventOfCode2021
//
//  Created by Sander Notenbomer on 02/12/2021.
//

import Foundation

class Day1: Day {
    var inputData: [Int] = []
    
    init() {
        super.init(number: 1)
    }
    
    func readFileInput() {
        do {
            if let filePath = bundle.path(forResource: "day1", ofType: "txt") {
                let contents = try String(contentsOfFile: filePath)
                let lines = contents.components(separatedBy: .newlines)
                
                for line in lines {
                    if let number = Int(line) {
                        inputData.append(number)
                    }
                }
            }
        } catch {
            return
        }
    }
    
    override func assignment1() -> String {
        return "Override!"
    }
}
