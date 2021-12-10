//
//  Day3.swift
//  AdventOfCode2021
//
//  Created by Sander Notenbomer on 07/12/2021.
//

import Foundation

class Day3: Day {
    var input = [Int: [Character]]()
    init() {
        super.init(number: 3)
    }
    
    override func convertData() {
        for line in data {
            let characters = Array(line)
            var x = 0
            for char in characters {
                var storedCharacters: [Character]
                if let dictCharacters = input[x] {
                    storedCharacters = dictCharacters
                    storedCharacters.append(char)
                } else {
                    storedCharacters = [char]
                }
                
                input.updateValue(storedCharacters, forKey: x)
                x += 1
            }
        }
    }
    
    override func assignment1() -> String {
        var gammaString = ""
        var epsilonString = ""
        let orderedInput = input.sorted(by: { $0.0 < $1.0 })
        for(_, characters) in orderedInput {
            let zeroCharacters = characters.filter { $0 == "0" }
            let oneCharacters = characters.filter { $0 == "1" }
            
            if(zeroCharacters.count > oneCharacters.count) {
                gammaString = "\(gammaString)0"
                epsilonString = "\(epsilonString)1"
            }
            else {
                gammaString = "\(gammaString)1"
                epsilonString = "\(epsilonString)0"
            }
        }
        
        guard let gamma = Int(gammaString, radix: 2) else { return "Inavlid gamma value" }
        guard let epsilon = Int(epsilonString, radix: 2) else { return "Inavlid epsilon value" }
        
        let result = gamma * epsilon
        
        return "\(result)"
    }
    
    override func assignment2() -> String {
        var searchData = data.filter({ $0.count > 0 })
        var x = 0
        repeat {
            let firstCharacters = searchData.map({ Array($0)[x]})
            let zeros = firstCharacters.filter({ $0 == "0" })
            let ones = firstCharacters.filter({ $0 == "1" })
            
            if zeros.count > ones.count {
                searchData = searchData.filter({ Array($0)[x] == "0" })
            } else {
                searchData = searchData.filter({ Array($0)[x] == "1" })
            }
            x += 1
        } while searchData.count > 1
        
        guard let oxygenRating = Int(searchData.first!, radix: 2) else { return "Illegal oxygen rating" }
        
        searchData = data.filter({ $0.count > 0 })
        x = 0
        repeat {
            let firstCharacters = searchData.map({ Array($0)[x]})
            let zeros = firstCharacters.filter({ $0 == "0" })
            let ones = firstCharacters.filter({ $0 == "1" })
            
            if zeros.count <= ones.count {
                searchData = searchData.filter({ Array($0)[x] == "0" })
            } else {
                searchData = searchData.filter({ Array($0)[x] == "1" })
            }
            x += 1
        } while searchData.count > 1
        
        guard let co2Rating = Int(searchData.first!, radix: 2) else { return "Illegal co2 rating" }
        
        return "\(oxygenRating * co2Rating)"
    }
}
