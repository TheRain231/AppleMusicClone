//
//  HomeView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var scrollPos: CGFloat = 0
    @State private var isScrolling: Bool = false
    private var matched = Namespace().wrappedValue
    
    var body: some View {
        ScrollView() {
            VStack(){
                topPicks()
                    
                topPicks()

                topPicks()
            }
            
            .scrollTargetBehavior(.viewAligned)
            .safeAreaInset(edge: .top) {
                CustomHeader.header() 
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
            CustomHeader.overlay(scrollPos)
        }
    }
    
    @ViewBuilder
    func topPicks() -> some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Text("Top picks for you")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<5) { _ in
                        VStack(alignment: .leading){
                            Text("Made for You")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            topPick()
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        
    }
    
    @ViewBuilder
    func topPick() -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Gradient(colors: [.accentColor, .accentColor.opacity(0.5), .accentColor]))
                .frame(width: 250, height: 320)
            VStack {
                Spacer()
                Rectangle()
                    .foregroundStyle(.black.opacity(0.2))
                    .frame(width: 250, height: 110)
                    .mask{
                        VStack{
                            Rectangle()
                                .offset(y: 20)
                            RoundedRectangle(cornerRadius: 10)
                        }
                    }
                    .overlay(alignment: .center){
                        Text("КИТЧ, Tell Me a Fairytale, Монеточка, Noize MC, MORGENSHTERN")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .offset(y: 10)
                            .padding()
                    }
            }
            HStack{
                VStack(alignment: .leading){
                    Text("Get Up!")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.white)
                    Text("Mix")
                        .font(.title)
                        .foregroundStyle(.white)
                    Spacer()
                }
                Spacer()
            }
            .padding(35)
        }
        .padding(.trailing, 5)
    }
}

struct customScrollTarget: ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        let endPoint = target.rect.minY
        
        if endPoint < 40 {
            if endPoint < 20{
                target.rect.origin = .zero
            }
            else {
                target.rect.origin = .init(x: 0, y: 40)
            }
        }
    }
}

#Preview {
    GeometryReader{ _ in
        HomeView()
    }
}
