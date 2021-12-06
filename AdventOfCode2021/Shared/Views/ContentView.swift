//
//  ContentView.swift
//  Shared
//
//  Created by Sander Notenbomer on 01/12/2021.
//

import SwiftUI

struct ContentView: View {
    var puzzle: Puzzle
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Advent of Code 2021")){
                    ForEach(puzzle.days, content: {
                        day in
                        NavigationLink("Day \(day.number)",
                                       destination: {
                            DayView(day: day)
                        })
                    })
                }
            }.navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let puzzle = Puzzle()
        
        ContentView(puzzle: puzzle)
    }
}
