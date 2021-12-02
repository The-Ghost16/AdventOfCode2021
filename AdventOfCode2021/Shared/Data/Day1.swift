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
    
    override func assignment1() -> String {
        readFile()
        
        if(data.isEmpty) {
            return "File not read correctly!"
        }
        
        var previousNumber = -1
        var count = 0
        for (index, line) in data.enumerated() {
            if let number = Int(line) {
                if(index == 0) {
                    previousNumber = number;
                    continue
                }
                
                if number > previousNumber {
                    count += 1
                }
                
                previousNumber = number;
            }
        }
        
        
        
        return "\(count)"
    }
    
    override func assignment2() -> String {
        readFile()
        
        if(data.isEmpty) {
            return "File not read correctly!"
        }
        
        var input: [Int] = []
        for line in data {
            if let number = Int(line) {
                input.append(number)
            }
        }
        
        var i = 0
        var calculations: [Int] = []
        repeat {
            let values = input[i...i+2]
            calculations.append(values.reduce(0, +))
            
            i += 1
        } while i < input.count - 2
        
        var previousNumber = -1
        var count = 0
        for (index, number) in calculations.enumerated() {
            if(index == 0) {
                previousNumber = number;
                continue
            }
            
            if number > previousNumber {
                count += 1
            }
            
            previousNumber = number;
        }
        
        return "\(count)"
    }
}
