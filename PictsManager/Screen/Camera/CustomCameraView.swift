//
//  CustomCameraView.swift
//  PictsManager
//
//  Created by Stevens on 19/03/2024.
//

import SwiftUI

struct CustomCameraView: View {
    
    let cameraViewModel = CameraViewModel()
    @Binding var capturedImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            CameraView(cameraViewModel: cameraViewModel) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
                        presentationMode.wrappedValue.dismiss()
                        if let image = capturedImage {
                            cameraViewModel.uploadImage(paramName: "file", fileName: "taken_with_picts_manager.png", image: image)
                        }
                    } else {
                        print("Error: no image data found")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            
            VStack {
                Spacer()
                Button(action: {
                    cameraViewModel.capturePhoto()
                }, label: {
                    Image(systemName: "circle")
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                })
                .padding(.bottom)
            }
        }
    }
}

