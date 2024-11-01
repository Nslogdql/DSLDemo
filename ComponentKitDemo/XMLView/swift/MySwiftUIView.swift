//
//  MySwiftUIView.swift
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/30.
//

import SwiftUI

struct MySwiftUIView: View {
    @State private var inputText: String = "" // 用于存储输入的文本
    @StateObject private var nodeModel = nodeSwift()
    var body: some View {
        VStack {
            TextField("请输入文本", text: $nodeModel.name) // 绑定到 inputText
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("你输入的内容是：\(nodeModel.name)") // 显示输入的内容
                .padding()
                .font(.headline)
        }
        .padding()
    }
}


#Preview {
    MySwiftUIView()
}
