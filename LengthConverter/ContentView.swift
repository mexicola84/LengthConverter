//
//  ContentView.swift
//  LengthConverter
//
//  Created by Jan Grimm on 30.11.23.
//

import SwiftUI

struct ContentView: View {
    @State private var initValue = 10.0
    @State private var startUnit = "meters"
    @State private var targetUnit = "feet"
    @FocusState private var lengthIsFocused: Bool
    
    let units = ["millimeters", "centimeters", "meters", "kilometers", "inches", "feet", "yards", "miles"]
    
    var unitConverter: Double {
        let baseUnit = Measurement(value: initValue, unit: UnitLength.meters)
        var convertedValue: Double = 0
        
        if targetUnit == startUnit {
            convertedValue = initValue
        } else if targetUnit == "millimeters" {
            convertedValue = baseUnit.converted(to: UnitLength.millimeters).value
        } else if targetUnit == "centimeters" {
            convertedValue = baseUnit.converted(to: UnitLength.centimeters).value
        } else if targetUnit == "meters" {
            convertedValue = baseUnit.converted(to: UnitLength.meters).value
        } else if targetUnit == "kilometers" {
            convertedValue = baseUnit.converted(to: UnitLength.kilometers).value
        } else if targetUnit == "inches" {
            convertedValue = baseUnit.converted(to: UnitLength.inches).value
        } else if targetUnit == "feet" {
            convertedValue = baseUnit.converted(to: UnitLength.feet).value
        } else if targetUnit == "yards" {
            convertedValue = baseUnit.converted(to: UnitLength.yards).value
        } else if targetUnit == "miles" {
            convertedValue = baseUnit.converted(to: UnitLength.miles).value
        }
        
        return Double(convertedValue)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Input Measure", value: $initValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($lengthIsFocused)
                    Picker("Input Unit", selection: $startUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Convert to:") {
                    Picker("Target Unit", selection: $targetUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Final Value") {
                    Text("\(unitConverter) \(targetUnit)")
                }
            }
            .navigationTitle("LengthConverter")
            .toolbar {
                if lengthIsFocused {
                    Button("Done") {
                        lengthIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
