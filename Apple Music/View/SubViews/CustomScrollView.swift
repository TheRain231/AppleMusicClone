//
//  CustomScrollView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 25.10.2024.
//

import SwiftUI

struct CustomScrollView<Content: View>: View {
    let content: Content
    let title: String
    let editButton: Bool
    let hasSearch: Bool
    @State private var scrollPos: CGFloat = 0

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.editButton = false
        self.hasSearch = false
    }
    
    init(title: String, editButton: Bool, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.editButton = editButton
        self.hasSearch = false
    }
    
    init(title: String, hasSearch: Bool, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.editButton = false
        self.hasSearch = hasSearch
    }
    
    init(title: String, editButton: Bool, hasSearch: Bool, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.editButton = editButton
        self.hasSearch = hasSearch
    }

    var body: some View {
        ScrollView {
            VStack {
                content
                
                Spacer(minLength: editButton ? 150 : 0)
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaInset(edge: .top) {
                VStack{
                    if hasSearch{
                        Rectangle()
                            .foregroundStyle(.clear)
                            .frame(height: 25)
                    }
                    CustomHeader.header(title, scrollPos, editButton: editButton)
                }
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
            CustomHeader.overlay(title, scrollPos, hasSearch: hasSearch)
        }
    }
}
