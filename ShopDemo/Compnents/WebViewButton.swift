import SwiftUI
import WebKit

struct WebViewButton: View {
    @State private var showWebView = false

    var body: some View {
        Button(action: {
            self.showWebView = true
        }) {
            Image(systemName: "arrow.right.circle")
            Text("前往 WebView")
                .bold()
        }
        .sheet(isPresented: $showWebView) {
            WebViewPage()
        }
    }
}

struct WebViewPage: View {
    var body: some View {
        WebView(url: URL(string: "https://bebit2.shoplineapp.com/products/product-3")!)
            .edgesIgnoringSafeArea(.all)
    }
}



struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        uiView.load(request)
    }
}




struct WebViewButton_Previews: PreviewProvider {
    static var previews: some View {
        WebViewButton()
    }
}
