//
//  ContentView.swift
//  LengthConverter
//
//  Created by Jan Grimm on 30.11.23.
//

import SwiftUI

struct ContentView: View {
    @State private var initValue = 10.0
    @State private var startUnit = "m"
    @State private var targetUnit = "ft."
    @FocusState private var lengthIsFocused: Bool
    
    let units = ["mm", "cm", "m", "km", "in.", "ft.", "yd.", "mi."]
    
    var unitConverter: Double {
        var baseUnit = Measurement(value: initValue, unit: UnitLength.meters)
        var convertedValue: Double = 0
        
        if startUnit == "mm" {
            baseUnit = Measurement(value: initValue, unit: UnitLength.millimeters)
        } else if startUnit == "cm" {
            baseUnit = Measurement(value: initValue, unit: UnitLength.centimeters)
        } else if startUnit == "m" {
            baseUnit = Measurement(value: initValue, unit: UnitLength.meters)
        } else if startUnit == "km" {
            baseUnit = Measurement(value: initValue, unit: UnitLength.kilometers)
        } else if startUnit == "in." {
            baseUnit = Measurement(value: initValue, unit: UnitLength.inches)
        } else if startUnit == "ft." {
            baseUnit = Measurement(value: initValue, unit: UnitLength.feet)
        } else if startUnit == "yd." {
            baseUnit = Measurement(value: initValue, unit: UnitLength.yards)
        } else if startUnit == "mi." {
            baseUnit = Measurement(value: initValue, unit: UnitLength.miles)
        }
        
        if targetUnit == startUnit {
            convertedValue = initValue
        } else if targetUnit == "mm" {
            convertedValue = baseUnit.converted(to: UnitLength.millimeters).value
        } else if targetUnit == "cm" {
            convertedValue = baseUnit.converted(to: UnitLength.centimeters).value
        } else if targetUnit == "m" {
            convertedValue = baseUnit.converted(to: UnitLength.meters).value
        } else if targetUnit == "km" {
            convertedValue = baseUnit.converted(to: UnitLength.kilometers).value
        } else if targetUnit == "in." {
            convertedValue = baseUnit.converted(to: UnitLength.inches).value
        } else if targetUnit == "ft." {
            convertedValue = baseUnit.converted(to: UnitLength.feet).value
        } else if targetUnit == "yd." {
            convertedValue = baseUnit.converted(to: UnitLength.yards).value
        } else if targetUnit == "mi." {
            convertedValue = baseUnit.converted(to: UnitLength.miles).value
        }
        
        return Double(convertedValue)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section ("Insert Value") {
                    TextField("Input Measure", value: $initValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($lengthIsFocused)
                    Picker("Input Unit", selection: $startUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Convert to") {
                    Picker("Target Unit", selection: $targetUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
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
