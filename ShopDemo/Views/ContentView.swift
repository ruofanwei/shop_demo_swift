import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State private var showSaleModal = false
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(productList, id: \.id) { product in
                                ProductCard(product: product)
                                    .environmentObject(cartManager)
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Sweater Shop")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                showSaleModal = true
                            }) {
                                Image(systemName: "globe.asia.australia")
                                    .padding(.top, 5)
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink {
                                CartView()
                                    .environmentObject(cartManager)
                            } label: {
                                CartButton(numberOfProducts: cartManager.products.count)
                            }
                        }
                    }
                }
                .tabItem {
                    Label("Shop", systemImage: "house")
                }
                
                WebViewPage()
                    .tabItem {
                        Label("WebView", systemImage: "globe")
                    }
                
                CartView()
                    .environmentObject(cartManager)
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
            }
            if showSaleModal {
                SaleModalView(showModal: $showSaleModal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
struct SaleModalView: View {
    @Binding var showModal: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("sale")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .cornerRadius(15)
                .shadow(radius: 10)

            Button(action: {
                showModal = false
            }) {
                Image(systemName: "xmark.circle.fill") // System close icon
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding([.top, .trailing], 10)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
