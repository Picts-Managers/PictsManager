//
//  ContentView.swift
//  PictsManager
//
//  Created by Charles Lamarque on 04/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        let viewModel = AuthViewModel()
        LoginScreen(viewModel:viewModel)
    }
    
}

#Preview {
    ContentView()
}
