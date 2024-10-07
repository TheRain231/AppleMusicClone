//
//  TabBarView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct TabBarView: View {
    @Environment(\.pageNumber) private var selectedTab
    
    private var tabs: [Tab] = [
        .init(.home, title: "Home", imageName: "house.fill"),
        .init(.new, title: "New", imageName: "square.grid.2x2.fill"),
        .init(.radio, title: "Radio", imageName: "dot.radiowaves.left.and.right"),
        .init(.library, title: "Library", imageName: "square.stack.fill"),
        .init(.search, title: "Search", imageName: "magnifyingglass")
    ]
    
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(.thickMaterial)
                .mask {
                    VStack(spacing: 0) {
                        LinearGradient(
                            colors: [
                                Color.black.opacity(1),
                                Color.black.opacity(0),
                            ],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                        Rectangle()
                    }
                }
                .frame(height: 50)
                .offset(y: 8)
            HStack() {
                ForEach(tabs, id: \.self){ tab in
                    tabItemView(tab)
                }
            }
            .background(.thickMaterial)
        }
        .frame(maxWidth: .infinity)
    }
    
    func tabItemView(_ tab: Tab) -> some View {
        Button {
            withAnimation(.smooth(duration: 0.1)){
                selectedTab.setTo(tab.tab)
            }
        } label: {
            VStack {
                Image(systemName: tab.imageName)
                    .font(.title2)
                    .frame(width: 25, height: 25)
                Text(tab.title)
                    .font(.caption2)
            }
            .foregroundStyle(selectedTab.pageNumber == tab.tab ? .red : .primary)
            .padding(5)
            .padding(.horizontal, 16)
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    TabBarView()
}
