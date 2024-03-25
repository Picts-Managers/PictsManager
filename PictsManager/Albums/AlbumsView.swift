//
//  AlbumsView.swift
//  PictsManager
//
//  Created by Charles Lamarque on 17/03/2024.
//

import SwiftUI

struct AlbumsView: View {
  @State private var addingAlbum = false
  @State private var title = ""
  
  var body: some View {
    NavigationStack {
      VStack {
        List {
          MyAlbumsRow(rowTitle: "Mes albums", albums: [Album(id: 12, name: "Vacances", pictureNames: ["turtlerock", "02"]), Album(id: 13, name: "Montagne", pictureNames: ["silversalmoncreek", "02"]), Album(id: 15, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"]), Album(id: 20, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"]), Album(id: 21, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"]), Album(id: 22, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"]), Album(id: 23, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"]), Album(id: 24, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"]), Album(id: 25, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"]), Album(id: 26, name: "Canada 2023", pictureNames: ["twinlake", "02", "03"])], afficherToutButton: true)
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
          .alert("Nouvel album", isPresented: $addingAlbum) {
            TextField("Titre", text: $title)
            Button {
              title = ""
              addingAlbum.toggle()
            } label: {
              Text("Annuler")
            }
            Button {
              createAlbum(name: title)
            } label: {
              Text("Enregistrer")
            }
            .disabled(title.isEmpty)
          } message: {
            Text("Saisissez un nom pour cet album.")
          }
        }
      }
      .navigationTitle("Albums")
    }
    
  }
  
  func createAlbum(name: String) {
    // Call API to create the album
    print("\(name)")
  }
}

#Preview {
  AlbumsView()
}
