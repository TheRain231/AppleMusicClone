//
//  ContentView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView()
            .safeAreaInset(edge: .bottom) {
                TabBarView()
            }
            .overlay {
                PlayerView(album: albums.first!, song: albums.first!.songs.first!)
                    .ignoresSafeArea()
            }
    }
}

struct TabView: View {
    @Environment(\.pageNumber) private var selectedTab

    var body: some View {
        GeometryReader{ _ in
            switch selectedTab.pageNumber{
            case .home:
                HomeView()
            case .new:
                NewView()
            case .radio:
                RadioView()
            case .library:
                LibraryView()
            case .search:
                SearchView()
            }
        }
    }
}



#Preview {
    ContentView()
}
