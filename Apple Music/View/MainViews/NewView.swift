//
//  NewView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct NewView: View {
    @State private var scrollPos: CGFloat = 0
    
    var body: some View {
        CustomScrollView(title: "New") {
            kitches()
            lastestSongs()
        }
    }
    
    func lastestSongs() -> some View {
        VStack(alignment: .leading){
            Text("Latest songs")
                .font(.title)
                .bold()
            
            ScrollView(.horizontal) {
                HStack(spacing: 20){
                    ForEach(0..<songs.count / 4, id: \.self) { index in
                        VStack{
                            ForEach(0..<4, id: \.self) { songIndex in
                                let song = songs[index * 4 + songIndex]
                                SongCell(song: song)
                                    .frame(width: 335)
                            }
                        }
                    }
                    Spacer()
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        .safeAreaPadding(.horizontal)
        
    }
    
    func kitches() -> some View {
        VStack(alignment: .leading, spacing: 0){
            ScrollView(.horizontal) {
                HStack(spacing: 0){
                    ForEach(0..<5) { _ in
                        kitch()
                            .padding(.trailing)
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        
    }
    
    func kitch() -> some View {
            VStack(alignment: .leading){
                
                Text("NEW ALBUM")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                Text("Ловец Снов")
                    .font(.title3)
                    .fontWeight(.medium)

                Text("КИТЧ")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                
                AsyncImage(url: URL(string: "https://sun9-62.userapi.com/netaF6kxsMbDU4qj52sTZ4H76MWoonQwXr7CEg/BjfYSaIcTts.jpg")){ image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 330, height: 230)
                } placeholder: {
                    ProgressView()
                        .frame(width: 330, height: 230)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    ZStack{
                        Rectangle()
                            .fill(Gradient(colors: [.clear, .clear, .black.opacity(0.5)]))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        HStack(alignment: .bottom){
                            Text("КИТЧ выпускает свой второй альбом.")
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                            AsyncImage(url: URL(string: "https://sun9-50.userapi.com/s/v1/ig2/GtZf1oMQ11pCudSjRvYJemf6glyDEHKELMPTwFGKcj6kWfzhd9Nb3SL7meDEo5FgRxm2lPrnOrkHbYUlh2368ai-.jpg?quality=95&as=32x32,48x48,72x72,108x108,160x160,240x240,360x360,480x480,540x540,640x640,720x720,1080x1080,1280x1280,1440x1440,2560x2560&from=bu&u=CffIDw5DDirlKK0vWmGbSDtPsQFXU-Nngn9uN4z98WE&cs=807x807")){ image in
                                image.image?
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .frame(width: 60, height: 60)
                            }
                        }
                        .padding(10)
                    }
                }
        }
    }
}

#Preview {
    NewView()
}
