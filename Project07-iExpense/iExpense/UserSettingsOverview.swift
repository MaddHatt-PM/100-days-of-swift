//
//  UserSettingsOverview.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//
//  UserDefaults loads at the start of the app
//  Use as little data (<512kb) as possible as this will cause the splash screen to hang until finished
//  You can have your own UserDefaults to share data between apps, extensions, siri, etc
//  You cannot change the default values from UserDefaults if the key is not available
//  UserDefaults take some time to write out changes to permanent storage as it waits for multiple assignments
//    - Most of the time it is not a problem to look through, but it does exist

//  @AppStorage("key") handles the reading and writing to UserDefaults
//  If the key is not present, it will use the value set
//  Also does the same work as @State
//  By design, it does not handle more complex work such as structs/classes


import SwiftUI

struct UserSettingsOverview: View {
  @AppStorage("tapCount") private var tapCount = 20
  
  var body: some View {
    Button("Tap count: \(tapCount)") {
      tapCount += 1
    }
  }
}

struct UserSettingsOverview_Previews: PreviewProvider {
  static var previews: some View {
    UserSettingsOverview()
  }
}
