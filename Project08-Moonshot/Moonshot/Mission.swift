//
//  Mission.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import Foundation


struct Mission: Codable, Identifiable {
  struct CrewRole: Codable {
    let name: String
    let role: String
  }
  
  let id: Int
  let launchDate: Date?
  let crew: [CrewRole]
  let description: String
  
  var displayName: String {
    "Apollo \(id)"
  }
  
  var image: String {
    "apollo\(id)"
  }
  
  var formattedDescription: String {
    "\t" + description.replacingOccurrences(of: "\n", with: "\n\t")
  }
  
  var formattedLaunchDate: String {
    launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
  }
}
