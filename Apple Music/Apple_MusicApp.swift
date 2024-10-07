//
//  Apple_MusicApp.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

@main
struct Apple_MusicApp: App {
    @State private var pageNumber: PageNumberStore = .init(.home)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.pageNumber, pageNumber)
        }
    }
}
