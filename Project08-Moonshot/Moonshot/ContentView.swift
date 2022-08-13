//
//  ContentView.swift
//  Moonshot
//
//  Created by Patt Martin on 8/12/22.
//

import SwiftUI

struct ContentView: View {
  let astronauts:[String: Astronaut] = Bundle.main.decode("astronauts.json")
  let missions:[Mission] = Bundle.main.decode("missions.json")
  
  var body: some View {
    Text("Astronaut Count: \(astronauts.count)")
      .padding()
    Text("Mission Count: \(missions.count)")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
