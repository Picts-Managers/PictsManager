//
//  Albums.swift
//  PictsManager
//
//  Created by Valentin Caure on 12/03/2024.
//

import SwiftUI

struct Albums: View {
    var body: some View {
        ZStack(content: {
            Color.green

            Image.init(systemName: "rectangle.stack.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100))
        })    }
}

#Preview {
    Albums()
}
