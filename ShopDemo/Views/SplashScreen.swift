//
//  SplashScreen.swift
//  ShopDemo
//
//  Created by 魏偌帆 on 2023/12/4.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image("splash")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
