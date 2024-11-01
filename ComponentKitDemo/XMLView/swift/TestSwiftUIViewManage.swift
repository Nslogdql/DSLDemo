//
//  TestSwiftUIViewManage.swift
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/30.
//
/**
在UIKit中使用SwiftUI，需要使用UIHostingController对SwiftUI进行包装，返回的是UIViewController类型。
但是UIHostingController是SwiftUI的类，在OC中是不可以直接使用的，
所以我们可以先创建一个Swift管理类，用来返回被包装的SwiftUI的控制器是UIViewController类型，
可以直接在OC代码中使用。
 */


import Foundation
import UIKit
import SwiftUI
@objc class TestSwiftUIViewManage: NSObject{
    
    @objc func makeManageTestSwiftUIView() -> UIViewController {
           return UIHostingController(rootView: MySwiftUIView())
       }
}
