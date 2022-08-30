//
//  Paths.swift
//  Project09-Drawing
//
//  Created by Patt Martin on 8/29/22.
//

import SwiftUI

struct Paths: View {
  var body: some View { VStack {
    Path { path in
      path.move(to: CGPoint(x: 200, y: 100))
      path.addLine(to: CGPoint(x: 100, y: 300))
      path.addLine(to: CGPoint(x: 300, y: 300))
      path.addLine(to: CGPoint(x: 200, y: 100))
      //            path.closeSubpath()
    }
    //          .stroke(.white, lineWidth: 10)
    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
  }
  }
}

struct Paths_Previews: PreviewProvider {
  static var previews: some View {
    Paths()
  }
}
