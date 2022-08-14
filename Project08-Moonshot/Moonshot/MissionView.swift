//
//  MissionView.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import SwiftUI

struct MissionView: View {
  let mission: Mission
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geo.size.width * 0.6)
            .padding(.top)
          
          VStack(alignment: .leading) {
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            
            Text(mission.formattedDescription)
          }
          .padding(.horizontal)
        }
        .padding(.bottom)
      }
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    
    .background(
      ZStack {
        Color.darkBackground
          .ignoresSafeArea()
        
        Image(mission.image)
          .resizable()
          .scaledToFill()
          .blur(radius: 50)
          .opacity(0.1)
          .ignoresSafeArea()
      }
    )
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  
    static var previews: some View {
      MissionView(mission: missions[0])
        .preferredColorScheme(.dark)
    }
}
