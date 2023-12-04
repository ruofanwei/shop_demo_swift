import SwiftUI
import GoogleSignIn

struct LoginView: View {
    @State var signedIn = false

    var body: some View {
        VStack {
            Text("Welcome to ShopDemo")
                .font(.largeTitle)
                .padding()

           
        }
    }

   
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
