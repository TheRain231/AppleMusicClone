//
//  SongCell.swift
//  Apple Music
//
//  Created by Андрей Степанов on 25.10.2024.
//

import SwiftUI

struct SongCell: View {
    let song: Song
    
    var body: some View {
        HStack{
            Image(song.album.imageName)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading){
                Text(song.album.songs[song.number])
                Text(song.album.artist)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Button{
                
            } label: {
                Image(systemName: "ellipsis")
                    
            }
            .foregroundStyle(.primary)
        }
    }
}

#Preview {
    SongCell(song: songs[12])
}
