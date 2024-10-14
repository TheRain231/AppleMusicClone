//
//  AlbumView.swift
//  MusicApp
//
//  Created by Андрей Степанов on 16.09.2024.
//

import SwiftUI

struct AlbumView: View {
    let album: Album
    var body: some View {
        ScrollView{
            Image(album.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .padding(.horizontal)
            Text(album.text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .fontWidth(.expanded)
            Text(album.artist)
                .fontWeight(.medium)
            
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "play.fill")
                        .frame(width: 50)
                }
                .buttonStyle(NeumorphicButtonStyle(bgColor: .secondary.opacity(0.3)))
                
                Button {
                    
                } label: {
                    Image(systemName: "shuffle")
                        .frame(width: 50)
                }
                .buttonStyle(NeumorphicButtonStyle(bgColor: .secondary.opacity(0.3)))
            }
            
            Spacer(minLength: 20)
            Divider()
            Spacer(minLength: 5)
            
            ForEach(album.songs.indices, id: \.self){ song in
                VStack{
                    HStack(){
                        Group{
                            Text("\(song + 1)  ").foregroundStyle(.secondary) + Text(album.songs[song])
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.gray)
                                .padding(.horizontal, 20)
                        }
                    }
                    .padding(.vertical, 5)
                    Divider()
                        .padding(.horizontal, 20)
                        .padding(.leading, 20)
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
    }
}

#Preview {
    AlbumView(album: albums.first!)
}
