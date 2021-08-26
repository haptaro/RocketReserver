//
//  ContentView.swift
//  RocketReserver
//
//  Created by Kotaro Fukuo on 2021/08/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = ContentViewModel(
    translator: Translator()
  )

  var body: some View {
    NavigationView {
      VStack {
        if viewModel.isLoading {
          ProgressView()
        } else {
          List {
            ForEach(viewModel.launches) { launch in
              NavigationLink {
                ContentDetailView(launchID: launch.id)
              } label: {
                LaunchRow(launch: launch)
              }
            }
          }
          .refreshable {
            viewModel.loadLaunches()
          }
        }
      }
      .navigationTitle("Apollo iOS Tutorial")
      .onAppear {
        viewModel.loadLaunches()
      }
    }
  }
}

//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}

extension LaunchListQuery.Data.Launch.Launch: Identifiable {}
