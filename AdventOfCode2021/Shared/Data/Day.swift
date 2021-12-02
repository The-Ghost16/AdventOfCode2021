//
//  Day.swift
//  AdventOfCode2021
//
//  Created by Sander Notenbomer on 02/12/2021.
//

import Foundation

class Day {
    let number: Int
    let bundle: Bundle
    var data: [String]
    
    init(number: Int) {
        self.number = number
        self.data = []
        self.bundle = Bundle.main
    }
    
    func readFile() {
        do {
            if let filePath = bundle.path(forResource: "day\(number)", ofType: "txt") {
                let contents = try String(contentsOfFile: filePath)
                data = contents.components(separatedBy: .newlines)
            }
        } catch {
            return
        }
    }
    
    func assignment1() -> String {
        return "Not computed"
    }
    
    func assignment2() -> String {
        return "Not computed"
    }
}
