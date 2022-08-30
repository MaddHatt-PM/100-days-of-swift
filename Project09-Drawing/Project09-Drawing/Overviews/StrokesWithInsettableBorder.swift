//
//  StrokesWithInsettableBorder.swift
//  Project09-Drawing
//
//  Created by Patt Martin on 8/29/22.
//

import SwiftUI

struct StrokesWithInsettableBorder: View {
  var body: some View {
    VStack {
      Circle()
        .strokeBorder(.blue, lineWidth: 20)
      Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        .strokeBorder(.blue, lineWidth: 40)
    }
  }
}

struct StrokesWithInsettableBorder_Previews: PreviewProvider {
  static var previews: some View {
    StrokesWithInsettableBorder()
  }
}
