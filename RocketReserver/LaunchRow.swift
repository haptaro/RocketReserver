//
//  LaunchRow.swift
//  LaunchRow
//
//  Created by Kotaro Fukuo on 2021/08/25.
//

import SwiftUI

struct LaunchRow: View {
  let launch: UILaunch

  var body: some View {
    HStack {
      ImageArea(missionPatch: launch.missionPatchURLString)
      VStack(alignment: .leading) {
        Text(launch.missionName ?? "")
          .font(.body)
        Text(launch.site ?? "")
          .font(.caption)
      }
    }
  }
}

private extension LaunchRow {
  struct ImageArea: View {
    let missionPatch: String?
  
    var body: some View {
      if let missionPatch = missionPatch {
        AsyncImage(url: URL(string: missionPatch)!) { image in
          image
            .resizable()
        } placeholder: {
          ProgressView()
        }
        .frame(width: 45, height: 45)
      } else {
        Image("placeholder_logo")
          .resizable()
          .frame(width: 45, height: 45)
      }
    }
  }
}

//struct LaunchRow_Previews: PreviewProvider {
//  static var previews: some View {
//  }
//}
