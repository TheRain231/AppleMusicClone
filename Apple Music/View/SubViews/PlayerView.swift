//
//  PlayerView.swift
//  MusicApp
//
//  Created by Андрей Степанов on 16.09.2024.
//

import SwiftUI

struct PlayerView: View {
    
    enum TransitionID : Hashable{
        case cover
        case title
        case back
        case play
        case forward
        case artist
    }
    
    @Namespace
    var namespace
    
    @State var isExpanded = false
    var album: Album
    var song: String
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                content
            }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: isExpanded ? .infinity : 65
                )
                .background{
                    Rectangle()
                        .foregroundStyle(.thinMaterial)
                        .ignoresSafeArea(edges: .bottom)
                }
                .animation(.spring, value: isExpanded)
                .onTapGesture {
                    isExpanded.toggle()
                }
        }
        
    }
}

extension PlayerView {
    
    @ViewBuilder
    var content: some View {
        if (isExpanded){
            big
        } else {
            smol
        }
    }
    
    var smol: some View{
        HStack(spacing: 20){
            Image(album.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .matchedGeometryEffect(id: TransitionID.cover, in: namespace)
                .transition(.slide)
                .padding(.leading)
                .padding(.vertical, 10)
            VStack{
                Text(song)
                    .matchedGeometryEffect(id: TransitionID.title, in: namespace)
                Color.clear.frame(width: 0, height: 0)
                    .matchedGeometryEffect(id: TransitionID.artist, in: namespace)
            }
            

            
            Spacer()
            
            Group{
                Color.clear.frame(width: 0)
                    .matchedGeometryEffect(id: TransitionID.back, in: namespace)
                Button{
                    
                } label: {
                    Image(systemName: "play.fill")
                }
                .matchedGeometryEffect(id: TransitionID.play, in: namespace)

                Button{
                    
                } label: {
                    Image(systemName: "forward.fill")
                }
                .matchedGeometryEffect(id: TransitionID.forward, in: namespace)

                .padding(.trailing)
            }
            .foregroundStyle(.primary)
        }
    }
    
    var big: some View{
        VStack{
            Image(album.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                    .matchedGeometryEffect(id: TransitionID.cover, in: namespace)
                    .padding()

            HStack{
                VStack(alignment: .leading){
                    Text(song)
                        .bold()
                        .matchedGeometryEffect(id: TransitionID.title, in: namespace)
                    Text(album.artist)
                        .matchedGeometryEffect(id: TransitionID.artist, in: namespace)
                }
                Spacer()
            }
            .padding(.horizontal, 40)
            HStack(spacing: 40){
                Button{
                    
                } label: {
                    Image(systemName: "backward.fill")
                }
                .matchedGeometryEffect(id: TransitionID.back, in: namespace)
                Button{
                    
                } label: {
                    Image(systemName: "play.fill")
                }
                .matchedGeometryEffect(id: TransitionID.play, in: namespace)
                Button{
                    
                } label: {
                    Image(systemName: "forward.fill")
                }
                .matchedGeometryEffect(id: TransitionID.forward, in: namespace)

            }
            .foregroundStyle(.primary)
            .font(.largeTitle)
            .padding(20)
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            
    }
}

#Preview {
    ZStack{
        LinearGradient(colors: [.white, .blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        
        PlayerView(album: albums.first!, song: albums.first!.songs[6])
    }
}
