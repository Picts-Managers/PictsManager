//
//  AlbumRow.swift
//  PictsManager
//
//  Created by Charles Lamarque on 18/03/2024.
//

import SwiftUI

struct MyAlbumsRow: View {
  @State private var show = false
  var rowTitle: String
  var albums: [Album]
  var afficherToutButton: Bool
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(rowTitle)
          .font(.system(size: 23)).fontWeight(.bold)
          .frame(alignment: .leading)
        Spacer()
        if (afficherToutButton) {
          Button {
            
          } label: {
            Text("Tout afficher")
              .foregroundStyle(Color.blue)
          }
        }
      }
      .padding(.horizontal)
      .padding(.top, 10)
      .buttonStyle(PlainButtonStyle())
      
      ScrollView(.horizontal, showsIndicators: false) {
        VStack(alignment: .leading) {
          HStack(alignment: .top, spacing: 10) {
            AlbumPreview(album: Album(id: 17, name: "Récentes", pictureNames: [""]))
            ForEach(Array(albums.enumerated()), id: \.element) { index, album in
              if (index % 2 == 0) {
                AlbumPreview(album: album)
              }
            }
          }
          .padding(.horizontal)
          
          HStack(alignment: .top, spacing: 10) {
            FavoritesAlbumPreview(album: Album(id: 17, name: "Favorites", pictureNames: ["turtlerock"]))
            ForEach(Array(albums.enumerated()), id: \.element) { index, album in
              if (index % 2 != 0) {
                AlbumPreview(album: album)
              }
            }
          }
          .padding(.horizontal)
          .scrollTargetLayout()
        }
      }
      .scrollTargetBehavior(.viewAligned)
    }
    .padding(.bottom, 30)
    .listRowInsets(EdgeInsets())
  }
}

#Preview {
  AlbumRow(rowTitle: "Mes Albums", albums: [
    Album(id: 01, name: "Vacances", pictureNames: ["turtlerock", "truc", "03"]),
    Album(id: 02, name: "Soirée", pictureNames: ["turtlerock", "02"]),
  ], afficherToutButton: true)
}
