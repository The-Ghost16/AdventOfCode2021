//
//  Day2.swift
//  AdventOfCode2021
//
//  Created by Sander Notenbomer on 02/12/2021.
//

import Foundation

class Day2: Day {
    var items: [Item] = []
    
    init() {
        super.init(number: 2)
    }
    
    override func convertData() {
        for line in data {
            let optionalLineData = line.split(separator: " ")
            guard let action = optionalLineData.first else { continue }
            guard let movesString = optionalLineData.last else { continue }
            if let moves = Int(movesString) {
                let item = Item(action: String(action), moves: moves)
                items.append(item)
            }
        }
    }
    
    override func assignment1() -> String {
        let grouped = Dictionary(grouping: items, by: { $0.action } )
        let results = grouped.keys.map { (key) -> Item in
            let value = grouped[key]!
            return Item(action: key, moves: value.map{$0.moves}.reduce(0, +))
        }
        let forward = results.first(where: {$0.action == "forward" })!
        let up = results.first(where: {$0.action == "up" })!
        let down = results.first(where: {$0.action == "down" })!
        
        let horizontal = forward.moves
        let depth = down.moves - up.moves
        
        let result = horizontal * depth
        
        return "\(result)"
    }
    
    override func assignment2() -> String {
        var horizontal = 0
        var aim = 0
        var depth = 0
        for item in items {
            switch item.action {
            case "down":
                aim += item.moves
            case "up":
                aim -= item.moves
            case "forward":
                horizontal += item.moves
                depth += item.moves * aim
            default:
                print("illegal action!")
            }
        }
        
        let result = horizontal * depth
        
        return "\(result)"
    }
}

struct Item {
    let action: String
    let moves: Int
}
