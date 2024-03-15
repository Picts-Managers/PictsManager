//
//  ContentView.swift
//  PictsManager
//
//  Created by Valentin Caure on 12/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Photos()
                .tabItem() {
                    Image(systemName: "photo.fill.on.rectangle.fill")
                    Text("Photothèque")
                }
            Albums()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Albums")
                }
            Search()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Rechercher")
                }
        }
    // var body: some View{
    //     LoginScreen()
    }
}

#Preview {
    ContentView()
}
