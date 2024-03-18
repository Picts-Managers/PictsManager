//
//  AlbumRow.swift
//  PictsManager
//
//  Created by Charles Lamarque on 18/03/2024.
//

import SwiftUI

struct AlbumRow: View {
  @State private var show = false
  
  var rowTitle: String
  var albums: [String]
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(rowTitle)
          .font(.headline)
          .frame(alignment: .leading)
        Spacer()
        Button {
          
        } label: {
          Text("Tout afficher")
            .foregroundStyle(Color.blue)
        }
      }
      .buttonStyle(PlainButtonStyle())
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          Text("1")
          Text("2")
        }
      }
    }
    .padding(.bottom, 15)
  }
}

#Preview {
  AlbumRow(rowTitle: "Mes Albums", albums: ["1", "2"])
}
