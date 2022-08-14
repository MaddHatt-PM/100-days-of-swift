//
//  AstronautDetails.swift
//  Moonshot
//
//  Created by Patt Martin on 8/14/22.
//

import SwiftUI

struct AstronautDetails: View {
  let astronaut: Astronaut
  
  var body: some View {
    ScrollView {
      VStack {
        Image(astronaut.id)
          .resizable()
          .scaledToFit()
        
        Text(astronaut.formattedDescription)
          .padding()
          .padding(.bottom, 150)
      }
    }
    .background(
      ZStack {
        Color.darkBackground
        
        Image(astronaut.id)
          .resizable()
          .scaledToFill()
          .blur(radius: 50)
          .opacity(0.2)
      }
        .ignoresSafeArea()
    )
    .navigationTitle(astronaut.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct AstronautDetails_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    NavigationStack {
      AstronautDetails(astronaut: astronauts["armstrong"]!)
        .preferredColorScheme(.dark)
    }
  }
}
