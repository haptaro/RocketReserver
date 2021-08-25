//
//  ContentViewModel.swift
//  ContentViewModel
//
//  Created by Kotaro Fukuo on 2021/08/25.
//
import Foundation
import Combine

final class ContentViewModel: ObservableObject {
  @Published private(set) var launches = [LaunchListQuery.Data.Launch.Launch]()
  @Published private(set) var isLoading = true
  
  init() {}
  
  func loadLaunches() {
    Network.shared.apollo.fetch(query: LaunchListQuery()) { [unowned self] result in
      isLoading = false
      switch result {
      case let .success(graphQLResult):
        var _launches = [LaunchListQuery.Data.Launch.Launch]()
        if let launchConnection = graphQLResult.data?.launches {
          _launches.append(contentsOf: launchConnection.launches.compactMap { $0 })
        }
        self.launches = _launches
      case let .failure(error):
        print("Failure! Error: \(error)")
      }
    }
  }
}
