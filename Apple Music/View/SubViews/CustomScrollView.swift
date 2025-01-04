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
    @State private var scrollPos: CGFloat = 0

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.editButton = false
    }
    
    init(title: String, editButton: Bool, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.editButton = editButton
    }

    var body: some View {
        ScrollView {
            VStack {
                content
                
                Spacer(minLength: editButton ? 150 : 0)
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaInset(edge: .top) {
                CustomHeader.header(title, editButton: editButton)
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
            CustomHeader.overlay(title, scrollPos)
        }
    }
}
