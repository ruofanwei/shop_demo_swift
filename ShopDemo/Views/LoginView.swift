//
//  LoginView.swift
//  ShopDemo
//
//  Created by 魏偌帆 on 2023/12/4.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Welcome to ShopDemo")
                .font(.largeTitle)
                .padding()

            Button(action: {
                GIDSignIn.sharedInstance().signIn()
            }) {
                Text("Sign in with Google")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
