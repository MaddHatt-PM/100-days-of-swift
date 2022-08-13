//
//  HierarchicalCodableData.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import SwiftUI

struct User: Codable {
  let name: String
  let address: Address
}

struct Address: Codable {
  let street: String
  let city: String
}

struct HierarchicalCodableData: View {
  @State var user:User? = nil
  
  var body: some View {
    VStack {
      Spacer()
      if user != nil {
        Text("JSON Data")
        Text("Name: \(user!.name)")
        Text("Address:")
        Text("Street: \(user!.address.street)")
          .multilineTextAlignment(.leading)
        Text("City: \(user!.address.city)")
      } else {
        Text("You need to click the button")
      }
      
      Spacer()
      
      
      Button {
        decodeJSON()
      } label: {
        Text("Decode JSON")
          .frame(maxWidth: .infinity)
          .padding(.vertical, 8)
      }
      .buttonStyle(.borderedProminent)
      .padding()
      .padding(.bottom, 30)
      
    }
  }
  
  func decodeJSON() {
    let input = """
    {
      "name": "Taylor SwiftUI",
      "address": {
        "street": "555 Taylor Swift Avenue",
        "city": "Nashville"
      }
    }
    """
    
    let data = Data(input.utf8)
    if let user = try? JSONDecoder().decode(User.self, from: data) {
      self.user = user
    }
  }
}

struct HierarchicalCodableData_Previews: PreviewProvider {
  static var previews: some View {
    HierarchicalCodableData()
  }
}
