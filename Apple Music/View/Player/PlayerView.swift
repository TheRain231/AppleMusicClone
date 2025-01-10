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
    @State var slidingValue: CGFloat = 0.0 // for dragging big representation down to small
    var album: Album
    var song: String
    
    @State private var averageColor: Color = .clear
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                content
            }
            .animation(.snappy(duration: 0.45), value: isExpanded)
            .onTapGesture {
                if !isExpanded{
                    isExpanded = true
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if isExpanded && value.translation.height > 0 {
                            slidingValue = value.translation.height
                        }
                    }
                    .onEnded { value in
                        if slidingValue > UIScreen.main.bounds.height / 5 { // value of closing the big player
                            isExpanded = false
                        }
                        slidingValue = 0
                    }
            )
        }
        
    }
}

extension PlayerView {
    
    @ViewBuilder
    var content: some View {
        if (isExpanded){
            big
                .offset(y: slidingValue)
        } else {
            smol
        }
    }
    
    var smol: some View {
        HStack(spacing: 20){
            Image(album.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .matchedGeometryEffect(id: TransitionID.cover, in: namespace)
                .transition(.slide)
                .padding(.leading, 10)
                .padding(.vertical, 10)
            VStack {
                Text(song)
                    .lineLimit(1)
                    .offset(y:4)
                //.matchedGeometryEffect(id: TransitionID.title, in: namespace)
                Color.clear.frame(width: 0, height: 0)
                //.matchedGeometryEffect(id: TransitionID.artist, in: namespace)
            }
            
            
            Spacer()
            
            Group {
                Color.clear.frame(width: 0)
                //.matchedGeometryEffect(id: TransitionID.back, in: namespace)
                Button{
                    
                } label: {
                    Image(systemName: "play.fill")
                        .font(.title2)
                }
                //.matchedGeometryEffect(id: TransitionID.play, in: namespace)
                
                Button{
                    
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                }
                //.matchedGeometryEffect(id: TransitionID.forward, in: namespace)
                
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
                .fill(.ultraThickMaterial)
                .clipShape(.rect(cornerRadius: 15))
                .matchedGeometryEffect(id: TransitionID.background, in: namespace)
        }
        .shadow(radius: 20)
        .padding(10)
        .offset(y: -80)
    }
    
    var big: some View{
        VStack {
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
            
            HStack(spacing: 70){
                Button{
                    
                } label: {
                    Image(systemName: "backward.fill")
                }
                //                .matchedGeometryEffect(id: TransitionID.back, in: namespace)
                
                Button{
                    
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 60))
                }
                //                .matchedGeometryEffect(id: TransitionID.play, in: namespace)
                
                Button{
                    
                } label: {
                    Image(systemName: "forward.fill")
                }
                //                .matchedGeometryEffect(id: TransitionID.forward, in: namespace)
            }
            .font(.largeTitle)
            .padding(20)
        }
        .foregroundStyle(averageColor.getContrastText())
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background {
            ZStack{
                averageColor
                
                Image(album.imageName)
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 100)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 55, style: .continuous))
        .matchedGeometryEffect(id: TransitionID.background, in: namespace)
        .padding(.top, -10)
        .onAppear {
            if let uiImage = UIImage(named: album.imageName) {
                if let avgColor = uiImage.averageColor() {
                    averageColor = Color(avgColor)
                }
            }
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
        
        PlayerView(isExpanded: true, album: albums[4], song: albums[4].songs[4])
            .ignoresSafeArea()
    }
}
