//
//  AdventOfCode2021App.swift
//  Shared
//
//  Created by Sander Notenbomer on 01/12/2021.
//

import SwiftUI

@main
struct AdventOfCode2021App: App {
    @StateObject private var puzzle = Puzzle()
    
    var body: some Scene {
        WindowGroup {
            ContentView(puzzle: puzzle)
        }
    }
}
