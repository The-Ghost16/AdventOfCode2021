//
//  DayView.swift
//  AdventOfCode2021
//
//  Created by Sander Notenbomer on 02/12/2021.
//

import SwiftUI

struct DayView: View {
    var day: Day
    
    init(day: Day) {
        self.day = day
        self.day.readFile()
    }
    
    var body: some View {
        VStack {
            Text("Day \(day.number)")
                .font(.largeTitle)
                .textCase(.uppercase)
            Spacer()
            VStack {
                Text("Assignment 1")
                    .underline()
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                HStack {
                    Text("Output: ")
                    Text(day.assignment1())
                }
            }
            
            VStack {
                Text("Assignment 2")
                    .underline()
                    .fontWeight(.semibold)
                    .textCase(.uppercase)
                HStack {
                    Text("Output: ")
                    Text(day.assignment2())
                }
            }
            .padding(.top)
            
            Spacer()
        }
    }
}
