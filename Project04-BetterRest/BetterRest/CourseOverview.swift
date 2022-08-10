//
//  MaterialOverview.swift
//  BetterRest
//
//  Created by Patt Martin on 8/9/22.
//

import SwiftUI

struct CourseOverview : View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date.now
  
  func dateComponentsExample() {
//    var components = DateComponents()
//    components.hour = 8
//    components.minute = 0
//    let date = Calendar.current.date(from:components) ?? Date.now
    
    let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    
    print(hour + minute)
  }
  
  var body: some View {
    Form {
      
      Section (header: Text("Stepper Example")) {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...24, step: 0.25)
      }
      
      Section (header: Text("Date Picker Example")) {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
      }
      
      Section (header: Text("Date Picker Quirks")) {
        // Formatter autoconverts to locale formats
        Text(Date.now, format: .dateTime.month().day().year())
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now.formatted(date: .long, time: .shortened))
        Text(Date.now.formatted(date: .abbreviated, time: .complete))
      }
    }
  }
}

struct CourseOverview_Previews: PreviewProvider {
  static var previews: some View {
    CourseOverview()
  }
}
