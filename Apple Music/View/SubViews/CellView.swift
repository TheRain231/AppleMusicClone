//
//  CellView.swift
//  MusicApp
//
//  Created by Андрей Степанов on 16.09.2024.
//

import SwiftUI

struct CellView: View {
    let album: Album
    
    var body: some View {
        VStack{
            Image(album.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                VStack(alignment: .leading){
                    Text(album.text)
                        .font(.headline)
                    Text(album.artist)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
            }
        }
//        .padding()
//        .background{
//            RoundedRectangle(cornerRadius: 25)
//                .foregroundStyle(.thinMaterial)
//        }
    }
}

#Preview {
    ZStack{
        LinearGradient(colors: [.white, .blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        
        CellView(album: albums.first!)
            .padding()
    }
}
