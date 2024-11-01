//
//  nodeSwift.swift
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/30.
//

import Foundation
import Combine
class nodeSwift:ObservableObject{
    @Published var key: String=""
    @Published var name: String="123"
    @Published var sons: Array<Any> = []
    @Published var content: Array<Any> = []
    @Published var data: [String: Int] = [:]
    @Published var isRoot: Bool = false
    @Published var Node: nodeSwift = nodeSwift()
}
