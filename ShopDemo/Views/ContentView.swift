//
//  ContentView.swift
//  ShopDemo
//
//  Created by 魏偌帆 on 2023/11/27.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var colums = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: colums, spacing: 20) {
                    ForEach(productList, id: \.id) { product in ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Sweater Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
                
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
