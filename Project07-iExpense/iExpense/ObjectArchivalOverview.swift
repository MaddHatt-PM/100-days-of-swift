//
//  ObjectArchivalOverview.swift
//  iExpense
//
//  Created by Patt Martin on 8/12/22.
//
//  Codable is comparable to JS->Stringify
//   - Default format is JSON

import SwiftUI

struct AnotherUser: Codable {
  var firstName: String
  var lastName: String
}

struct ObjectArchivalOverview: View {
  @State private var user = AnotherUser(firstName: "Taylor", lastName: "SwiftUI")
  
  var body: some View {
    VStack {
      TextField("first name", text: $user.firstName)
      TextField("last name", text: $user.lastName)
      
      Button("Save User") {
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(user) {
          UserDefaults.standard.set(data, forKey: "userData")
          print(data)
        }
      }
    }
    .onAppear {
      if let userData = UserDefaults.standard.object(forKey: "userData") as? Data {
        let decoder = JSONDecoder()
        if let userLoaded = try? decoder.decode(AnotherUser.self, from: userData) {
          user = userLoaded
        }
      }
    }
  }
}

struct ObjectArchivalOverview_Previews: PreviewProvider {
  static var previews: some View {
    ObjectArchivalOverview()
  }
}
