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
  
  let columns = [
    GridItem(.adaptive(minimum: 150))
  ]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(missions) {mission in
            NavigationLink {
              MissionView(mission: mission)
            } label: {
              VStack {
                Image(mission.image)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 100, height: 100)
                  .shadow(color: .black.opacity(0.5), radius: 3 )
                  .background(
                    Image(mission.image)
                      .blur(radius: 20)
                      .opacity(0.4)
                      .clipped()
                  )
                  .padding()
                
                VStack {
                  Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                  
                  Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Rectangle().fill(.ultraThinMaterial))
              }
              .clipShape(RoundedRectangle(cornerRadius: 10))
            }
          }
        }
        .padding([.horizontal, .bottom])
      }
      .navigationTitle("Moonshot")
      .background(.darkBackground)
      .preferredColorScheme(.dark)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
