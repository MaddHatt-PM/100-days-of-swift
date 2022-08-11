/*
  ContentView.swift
  UnitConverter

  Created by Patt Martin on 8/8/22.

  Main takeaways:
    - Chained computed properties gets a little confusing, might be good to work around if possible
    - It would have been easier to have a single unit type instead of 'metricUnits' and 'imperialUnits'
        - 'inputCategory' and its UI element would have been eliminated
    -
*/

import SwiftUI
import Collections

struct ContentView: View {
    static let unitCategories = ["Metric", "Imperial"]
    static let metricUnits: OrderedDictionary = [
        "centimeter (cm)" : 1.0,
        "meter (m)" : 0.01,
        "kilometer (km)" : 0.00001
    ]
    static let imperialUnits: OrderedDictionary = [
        "inch (in)" : 1.0,
        "feet (ft)": (1/12.0),
        "yard (yd)": (1/36.0),
        "mile (mi)": (1/63360.0)
    ]
    
    @State var inputValue:Double? = 0.0
    @State var inputCategory = "Metric"
    @State var inputUnit = "centimeter (cm)"
    
    var inputUnitSelection: OrderedDictionary<String, Double> {
        return inputCategory == "Metric" ? ContentView.metricUnits : ContentView.imperialUnits
    }

    @State var outputCategory = "Imperial"
    @State var outputUnit = ContentView.imperialUnits.keys[0]
    var outputUnitSelection: OrderedDictionary<String, Double> {
        return inputCategory != "Metric" ? ContentView.metricUnits : ContentView.imperialUnits
    }

    var outputValue: Double {
        let baseInputValue = (inputValue ?? 0.0) / (inputUnitSelection[inputUnit] ?? 1.0)
        
        let cmToInch = 0.393701
        let inchToCM = 2.54
        let converter = inputCategory == "Metric" ? cmToInch : inchToCM

        let baseOutputValue = baseInputValue * converter
        let outputValue = baseOutputValue * (outputUnitSelection[outputUnit] ?? 1.0)
        return outputValue
    }
    
    @FocusState private var lengthIsFocused
    
    
    var outputPrefix: String {
        return String(outputUnit.split(separator: "(")[1].split(separator: ")")[0])
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Input Variables")) {
                        HStack {
                            Text("Length")
                            TextField("Value", value: $inputValue, format: .number)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.decimalPad)
                                .onTapGesture {
                                    if (inputValue ?? 0.0 == 0.0) {
                                        inputValue = nil
                                    }
                                }
                                .focused($lengthIsFocused)
                            
                        }

                        Picker("Unit Category", selection: $inputCategory) {
                            ForEach(ContentView.unitCategories, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .onChange(of: inputCategory) { newValue in
                            let inputUnits = newValue == "Metric" ? ContentView.metricUnits : ContentView.imperialUnits
                            inputUnit = inputUnits.keys[0]
                            
                            let outputUnits = newValue != "Metric" ? ContentView.metricUnits : ContentView.imperialUnits
                            outputUnit = outputUnits.keys[0]
                        }
    
                        
                        Picker("Unit Type", selection: $inputUnit) {
                            ForEach(Array(inputUnitSelection.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                    Section(header: Text("Output type")) {
                        Picker("Unit Type", selection: $outputUnit) {
                            ForEach(Array(outputUnitSelection.keys), id: \.self) {
                                Text("\($0)")
                            }
                        }
                        
                        
                    }
                    Section(header: Text("Final result")) {
                        Text("\(outputValue.formatted()) \(outputPrefix)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .navigationTitle("Length Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button {
                        lengthIsFocused.toggle()
                    } label: {
                        Text("Done")
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
