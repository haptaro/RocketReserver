//
//  Network.swift
//  Network
//
//  Created by Kotaro Fukuo on 2021/08/25.
//

import Foundation
import Apollo

final class Network {
  static let shared = Network()
  
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://apollo-fullstack-tutorial.herokuapp.com")!)
}
