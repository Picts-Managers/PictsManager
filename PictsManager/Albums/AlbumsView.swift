//
//  AlbumsView.swift
//  PictsManager
//
//  Created by Charles Lamarque on 17/03/2024.
//

import SwiftUI

struct AlbumsView: View {
  @State private var addingAlbum = false
  
  var body: some View {
    NavigationStack {
      VStack {
        List {
          AlbumRow(rowTitle: "Mes Albums", albums: [""])
          AlbumRow(rowTitle: "Albums Partagés", albums: [""])
          AlbumRow(rowTitle: "Personnes, animaux et lieux", albums: [""])
        }
        .listStyle(.inset)
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            addingAlbum.toggle()
          } label: {
            Label("New Album", systemImage: "plus")
          }
        }
      }
      .navigationTitle("Albums")
    }
  }
}

#Preview {
  AlbumsView()
}
