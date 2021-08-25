//
//  AppDelegate.swift
//  AppDelegate
//
//  Created by Kotaro Fukuo on 2021/08/25.
//

import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    Network.shared.apollo.fetch(query: LaunchListQuery()) { result in
      switch result {
      case let .success(graphQLResult):
        print("Success! Result: \(graphQLResult)")
      case let .failure(error):
        print("Failure! Error: \(error)")
      }
    }
    return true
  }
}
