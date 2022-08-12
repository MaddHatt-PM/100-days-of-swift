//
//  CourseOverview.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//

import SwiftUI

// When values are changed, the entire struct is recreated (not very wasteful)
// If multiple views are passed a struct, their structs are unique and will not reflect changes
// @State watches for this recreation cycle to reload views. It does not watch for property changes
//
// If multiple classes are passed a struct, they reference the original and will reflect changes
// @StateObject watches for property modifications. Private doesn't make sense since the object is meant to be passed around. This will only be applied to the original declaration. When the object is passed to other views, it should be declared as @ObservedObject
// @Published is used on class properties to notify views that are using the marked variable. Similiar to state
//
// @State structs are useful for singular views
// @StateObject/ObservedObject & @Published are useful for multiple views

class User: ObservableObject {
  @Published var firstName = "Bilbo"
  @Published var lastName = "Baggins"
}


struct StatesOverview: View {
  @StateObject var user = User()
  
  var body: some View {
    VStack {
      Text("Your name is \(user.firstName) \(user.lastName)")
      TextField("first name", text: $user.firstName)
      TextField("last name", text: $user.lastName)
    }
  }
}

struct CourseOverview_Previews: PreviewProvider {
  static var previews: some View {
    StatesOverview()
  }
}
