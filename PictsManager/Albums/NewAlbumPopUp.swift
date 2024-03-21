//
//  NewAlbumPopUp.swift
//  PictsManager
//
//  Created by Charles Lamarque on 19/03/2024.
//

import SwiftUI

struct NewAlbumPopUp: View {
  @State private var title = ""
  
  var body: some View {
    RoundedRectangle(cornerRadius: 20, style: .circular)
      .fill(Color.white.opacity(0.9))
      .strokeBorder(lineWidth: 1).foregroundColor(.gray.opacity(0.3))
      .frame(width: 260, height: 170)
      .overlay() {
        VStack {
          VStack {
            Text("Nouvel album")
              .font(.headline)
              .padding(.top, 10)
            Text("Saisissez un nom pour cet album.")
              .font(.caption)
            Spacer()
            TextField("Titre", text: $title)
              .padding(2)
              .background(Color.white)
              .font(.system(size: 16))
              .border(Color.gray.opacity(0.2), width: 1)
              .cornerRadius(5.0)
          }
          .padding()
          Spacer()
          HStack(alignment: .center) {
            Button {
              
            } label: {
              Text("Annuler")
            }
            Button {
              
            } label: {
              Text("Enregistrer")
                .foregroundStyle(!title.isEmpty == true
                                 ? Color.blue
                                 : Color.gray)
            }
          }
          .frame(height: 40)
        }
      }
  }
}

#Preview {
  NewAlbumPopUp()
}
