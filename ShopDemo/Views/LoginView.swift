import SwiftUI
import GoogleSignIn

struct LoginView: View {
    @State var signedIn = false

    var body: some View {
        VStack {
            Text("Welcome to ShopDemo")
                .font(.largeTitle)
                .padding()

            if !signedIn {
                Button(action: signIn) {
                    Text("Sign in with Google")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            } else {
                // User is signed in, proceed to ContentView or show sign out button
                Text("You are signed in!")
                Button("Sign Out", action: signOut)
            }
        }
    }

    func signIn() {
        GIDSignIn.sharedInstance().signIn()
    }

    func signOut() {
        GIDSignIn.sharedInstance().signOut()
        signedIn = false
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
