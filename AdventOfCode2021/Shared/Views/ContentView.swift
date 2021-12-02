//
//  ContentView.swift
//  Shared
//
//  Created by Sander Notenbomer on 01/12/2021.
//

import SwiftUI

let days: [Day] = [Day1()]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Advent of Code 2021")){
                    ForEach(days, id: \.self.number, content: {
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
        ContentView()
    }
}
