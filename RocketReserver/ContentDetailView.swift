//
//  ContentDetailView.swift
//  ContentDetailView
//
//  Created by Kotaro Fukuo on 2021/08/25.
//

import SwiftUI
import Apollo

struct ContentDetailView: View {
  let launchID: GraphQLID
  var body: some View {
    Text(launchID)
  }
}

struct ContentDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ContentDetailView(launchID: "1")
  }
}
