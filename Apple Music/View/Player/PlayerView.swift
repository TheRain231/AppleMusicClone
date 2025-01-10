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
    
    //Starting date of drag gesture
    @State private var startTime: Date? = nil
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                content
            }
            .animation(.snappy(duration: 0.45), value: isExpanded)
            
            // if player not extended, it extends on tap
            .onTapGesture {
                if !isExpanded{
                    isExpanded = true
                }
            }
            
            // if player is extended, it shrinks on dragging down
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if startTime == nil {
                            startTime = Date()
                        }
                        if isExpanded && value.translation.height > 0 {
                            slidingValue = value.translation.height
                        }
                    }
                    .onEnded { value in
                        var elapsedTime = TimeInterval()
                        if let start = startTime {
                            elapsedTime = Date().timeIntervalSince(start)
                            startTime = nil // Reset the start time
                        }
                        
                        if slidingValue > (elapsedTime < 0.05
                                           ? 50 // fast dragging
                                           : UIScreen.main.bounds.height / 2) { // value of closing the big player slower
                            isExpanded = false
                        }
                        withAnimation(.spring(duration: 0.1)){
                            slidingValue = 0
                        }
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
                .padding(.leading, 10)
                .padding(.vertical, 10)
            VStack {
                Text(song)
                    .lineLimit(1)
                    .offset(y:4)
                
                Color.clear.frame(width: 0, height: 0)
                
            }
            
            Spacer()
            
            Group {
                Button{
                    
                } label: {
                    Image(systemName: "play.fill")
                        .font(.title2)
                }
                
                
                Button{
                    
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                }
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
        }
        .matchedGeometryEffect(id: TransitionID.background, in: namespace)
        .shadow(radius: 20)
        .padding(10)
        .offset(y: -80)
    }
    
    var big: some View{
        VStack {
            Image(systemName: "minus")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Image(album.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .matchedGeometryEffect(id: TransitionID.cover, in: namespace)
                .padding(25)
            
            HStack{
                VStack(alignment: .leading){
                    Text(song)
                        .bold()
                    Text(album.artist)
                }
                Spacer()
                Button{
                    
                } label: {
                    Image(systemName: "ellipsis.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2)
                }
            }
            .padding(.horizontal, 40)
            
            // song timeline
            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 5) // line height
                            .padding(.horizontal, 40)
                            .padding(.top, 20)
                            .padding(.bottom, 30)
            
            HStack(spacing: 0){
                Button{
                    
                } label: {
                    Image(systemName: "backward.fill")
                }
                
                Spacer()
                
                Button{
                    
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 60))
                }
                
                Spacer()
                
                Button{
                    
                } label: {
                    Image(systemName: "forward.fill")
                }
            }
            .font(.largeTitle)
            .padding(45)
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
        .padding(.top, -10)
        .matchedGeometryEffect(id: TransitionID.background, in: namespace)
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
