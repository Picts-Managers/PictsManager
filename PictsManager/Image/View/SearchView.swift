//
//  Search.swift
//  PictsManager
//
//  Created by Valentin Caure on 12/03/2024.
//

import SwiftUI

struct Search: View {
    var body: some View {
        ZStack(content:{
            Color.blue

            Image.init(systemName: "magnifyingglass")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        })
    }
}

#Preview {
    Search()
}
