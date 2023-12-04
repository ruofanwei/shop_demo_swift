//
//  ShopDemoApp.swift
//  ShopDemo
//
//  Created by 魏偌帆 on 2023/11/27.
//

import SwiftUI
import GoogleSignIn

@main
struct ShopDemoApp: App {
    @State private var isShowingSplash = true

    
    var body: some Scene {
        WindowGroup {
            if isShowingSplash {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // 3 seconds delay
                            isShowingSplash = false
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}
