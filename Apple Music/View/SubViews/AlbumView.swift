//
//  AlbumView.swift
//  MusicApp
//
//  Created by Андрей Степанов on 16.09.2024.
//

import SwiftUI

struct AlbumView: View {
    let album: Album
    @Binding var path: [Album]
    
    var body: some View {
        ScrollView{
            VStack{
                Spacer(minLength: 90)
                
                
                Image(album.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.size.width * 2 / 3, height: UIScreen.main.bounds.size.width * 2 / 3)
                    .shadow(color: .black.opacity(0.4), radius: 20)
                Text(album.text)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(album.artist)
                    .fontWeight(.medium)
                
                HStack{
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "play.fill")
                                .frame(height: 20)
                            Text("Play")
                        }
                    }
                    .buttonStyle(NeumorphicButtonStyle(bgColor: .secondary.opacity(0.3)))
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image(systemName: "shuffle")
                                .frame(height: 20)
                            Text("Shuffle")
                        }
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
                Spacer(minLength: 150)
            }
        }
        .padding()
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.placeholder)
            }
            .foregroundColor(.primary)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .padding(.horizontal, 10)
    }
}

#Preview {
    LibraryView()
}
