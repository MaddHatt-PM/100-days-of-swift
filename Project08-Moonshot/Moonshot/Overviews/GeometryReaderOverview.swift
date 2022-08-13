//
//  GeometryReadOverview.swift
//  Moonshot
//
//  Created by Patt Martin on 8/13/22.
//

import SwiftUI

struct GeometryReaderOverview: View {
  var body: some View {
    ZStack {
      Color.secondary
        .ignoresSafeArea()
      
      VStack {
        
        Text("scaledToFit")
        Image("webb")
          .resizable()
          .scaledToFit()
          .frame(width: 200, height:200)
          .background(Color.secondary)
        
        Text("scaledToFill")
        Image("webb")
          .resizable()
          .scaledToFill()
          .frame(width: 200, height:200)
          .background(Color.secondary)
          .border(.mint)
        
        Text("GeometryReader")
        GeometryReader { geo in
          Image("webb")
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width * 0.9)
            .frame(width: geo.size.width)
        }
      }
    }
  }
}

struct GeometryReadOverview_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReaderOverview()
  }
}
