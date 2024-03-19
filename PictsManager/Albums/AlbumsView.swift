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
          MyAlbumsRow(rowTitle: "Mes albums", albums: [Album(id: 12, name: "Vacances", pictureNames: ["turtlerock", "02"]), Album(id: 13, name: "Montagne", pictureNames: ["silversalmoncreek", "02"]), Album(id: 15, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"])], afficherToutButton: true)
          AlbumRow(rowTitle: "Albums partagés", albums: [Album(id: 14, name: "Friends", pictureNames: ["turtlerock", "02"])], afficherToutButton: true)
          AlbumRow(rowTitle: "Personnes, animaux et lieux", albums: [Album(id: 16, name: "Friends", pictureNames: ["icybay", "02"])], afficherToutButton: false)
        }
        .listStyle(.inset)
      }
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Menu("AddAlbumMenu", systemImage: "plus") {
            Button("Nouvel album", systemImage: "rectangle.stack.badge.plus") { addingAlbum.toggle() }
            Button("Nouveau dossier", systemImage: "folder.badge.plus") { addingAlbum.toggle() }
            Button("Nouvel album partagé", systemImage: "rectangle.stack.badge.person.crop") { addingAlbum.toggle() }
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
