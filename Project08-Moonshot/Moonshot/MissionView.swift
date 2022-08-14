//
//  MissionView.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import SwiftUI

struct MissionView: View {
  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }
  
  let mission: Mission
  
  let crew: [CrewMember]
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geo.size.width * 0.6)
            .padding(.top)
            .padding(.bottom)
          
          Text("Launch Date: \(mission.formattedLaunchDate)")
            .font(.caption)
            .foregroundColor(.secondary)
          
          Seperator()
          
          VStack(alignment: .leading) {
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            
            Text(mission.formattedDescription)
          }
          .padding(.horizontal)
          
          Seperator()
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(crew, id: \.role) { crewMember in
                NavigationLink {
                  AstronautDetails(astronaut: crewMember.astronaut    )
                } label: {
                  HStack {
                    Image(crewMember.astronaut.id)
                      .resizable()
                      .frame(width: 104, height: 72)
                      .clipShape(Capsule())
                      .overlay(
                        Capsule()
                          .strokeBorder(.white, lineWidth: 1)
                      )
                    
                    VStack(alignment: .leading) {
                      Text(crewMember.astronaut.name)
                        .foregroundColor(.white)
                        .font(.headline)
                      
                      Text(crewMember.role)
                        .foregroundColor(.secondary)
                    }
                  }
                  .padding(.horizontal)
                }
              }
            }
          }
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
  
  init(mission: Mission, astronauts: [String: Astronaut]) {
    self.mission = mission
    self.crew = mission.crew.map{ member in
      if let astronaut = astronauts[member.name] {
        return CrewMember(role: member.role, astronaut: astronaut)
      } else {
        fatalError("Missing \(member.name)")
      }
    }
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
    static var previews: some View {
      MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
    }
}

struct Seperator: View {
  var body: some View {
    Rectangle()
      .frame(height:1)
      .foregroundColor(.lightBackground)
      .padding(.vertical)
  }
}
