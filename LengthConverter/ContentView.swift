//
//  ContentView.swift
//  LengthConverter
//
//  Created by Jan Grimm on 30.11.23.
//

import SwiftUI

struct ContentView: View {
    @State private var lengthValue = 10
    @State private var startMeasure = "m"
    @State private var targetMeasure = "ft."
    
    let measures = ["mm", "cm", "m", "km", "in.", "ft.", "yd.", "mi."]
    
    var measureConvert: Int {
        return 0
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Input Measure", value: $lengthValue, format: .number)
                    Picker("Input Format", selection: $startMeasure) {
                        ForEach(measures, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Convert to:") {
                    Picker("Target format", selection: $targetMeasure) {
                        ForEach(measures, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Final Value") {
                    Text("\(measureConvert) \(targetMeasure)")
                }
            }
            .navigationTitle("LengthConverter")
        }
    }
}

#Preview {
    ContentView()
}
