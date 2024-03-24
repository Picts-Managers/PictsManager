//
//  Navbar.swift
//  PictsManager
//
//  Created by Valentin Caure on 12/03/2024.
//

import SwiftUI



struct Navbar: View {
    @EnvironmentObject var toastManager: ToastManager
    @State private var toast: Toast? = nil
    
    var body: some View {
        VStack {
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
                
                UserScreen(viewModel: UserViewModel())
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Me")
                    }
            }
        }
        .toastView(toast: $toastManager.toast)
    }
}

#Preview {
    Navbar()
}
