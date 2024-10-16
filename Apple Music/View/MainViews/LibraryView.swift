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
            ScrollView{
                LazyVGrid(columns: [columnSize]){
                    ForEach(albums, id: \.self) { album in
                        NavigationLink(value: album) {
                            Button {
                                path.append(album)
                            } label: {
                                CellView(album: album)
                            }
                        }
                        .foregroundStyle(.primary)
                    }
                    .padding(10)
                }
                .navigationDestination(for: Album.self) {
                    AlbumView(album: $0, path: $path)
                        .ignoresSafeArea()
                }
                .safeAreaInset(edge: .top) {
                    CustomHeader.header("Library")
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(customScrollTarget())
            .onScrollGeometryChange(for: CGFloat.self) {
                $0.contentOffset.y + $0.contentInsets.top
            } action: { _, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    scrollPos = newValue
                }
            }
            .overlay {
                ZStack{
                    CustomHeader.overlay("Library", scrollPos, editButton: true)
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
