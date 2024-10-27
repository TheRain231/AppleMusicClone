//
//  LibraryView.swift
//  MusicApp
//
//  Created by Андрей Степанов on 16.09.2024.
//

import SwiftUI

struct LibraryView: View {
    @State private var path: [Album] = []
    @State private var scrollPos: CGFloat = 0
    
    var body: some View {
        NavigationStack(path: $path){
            CustomScrollView(title: "Library", editButton: true){
                LazyVGrid(columns: [columnSize]){
                    ForEach(albums, id: \.self) { album in
                        NavigationLink(value: album) {
                            CellView(album: album)
                        }
                        .foregroundStyle(.primary)
                    }
                    .padding(10)
                }
                .navigationDestination(for: Album.self) { album in
                    AlbumView(album: album)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

private let columnSize = GridItem(
    .adaptive(minimum: 150, maximum: .infinity),
    spacing: 0,
    alignment: .top
)

#Preview {
    LibraryView()
}
