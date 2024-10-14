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
        case background
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
            .animation(.snappy(duration: 0.45), value: isExpanded)
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
                .padding(.leading, 10)
                .padding(.vertical, 10)
            VStack{
                Text(song)
                    .lineLimit(1)
                    .offset(y:4)
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
                        .font(.title2)
                }
                .matchedGeometryEffect(id: TransitionID.play, in: namespace)

                Button{
                    
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                }
                .matchedGeometryEffect(id: TransitionID.forward, in: namespace)

                .padding(.trailing)
            }
            .foregroundStyle(.primary)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: 60
        )
        .background{
            Rectangle()
                .fill(Color(UIColor.systemBackground))
                .clipShape(.rect(cornerRadius: 15))
                .matchedGeometryEffect(id: TransitionID.background, in: namespace)
                
        }
        .shadow(radius: 20)
        .padding(10)
        .offset(y: -80)
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
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        
        .background{
            Rectangle()
                .fill(.thinMaterial)
                .matchedGeometryEffect(id: TransitionID.background, in: namespace)
                .ignoresSafeArea()
                
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
        
        PlayerView(album: albums.first!, song: albums.first!.songs[2])
            .ignoresSafeArea()
    }
}
