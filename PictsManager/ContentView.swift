//
//  ContentView.swift
//  PictsManager
//
//  Created by Valentin Caure on 12/03/2024.
//

import SwiftUI

struct ContentView: View {
<<<<<<< HEAD
//    var body: some View {
//        TabView {
//            Photos()
//                .tabItem() {
//                    Image(systemName: "photo.fill.on.rectangle.fill")
//                    Text("Photothèque")
//                }
//            Albums()
//                .tabItem {
//                    Image(systemName: "rectangle.stack.fill")
//                    Text("Albums")
//                }
//            Search()
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Rechercher")
//                }
//        }
     var body: some View{
         AuthScreen()
=======
    var body: some View {
<<<<<<< HEAD
        AuthScreen()
>>>>>>> b0c7c9c (add: init userscreen)
=======
        let userViewModel = UserViewModel()
        UserScreen(viewModel: userViewModel)
//        AuthScreen()
>>>>>>> beee41f (add: editable/non-editable textfields for user's information)
    }
}

#Preview {
    ContentView()
}
