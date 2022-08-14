//
//  Astronaut.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import Foundation

struct Astronaut: Codable, Identifiable {
  let id: String
  let name: String
  let description: String
  
  var formattedDescription: String {
    "\t" + description.replacingOccurrences(of: "\n", with: "\n\t")
  }
}
