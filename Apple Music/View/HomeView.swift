//
 //  HomeView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var scrollPos: CGFloat = 0
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack(spacing: 0){
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
                                topPicks()
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .safeAreaPadding(.horizontal)
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                }
            }
            .onScrollGeometryChange(for: CGFloat.self) {
                $0.contentOffset.y + $0.contentInsets.top
            } action: { _, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    scrollPos = newValue
                }
                print(scrollPos)
            }
            .navigationTitle("Home")
        }
        .overlay {
            GeometryReader{ _ in
                HStack{
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .opacity(scrollPos == -2.842170943040401e-14 ? 1 : 0)
                    }
                }
                .foregroundStyle(.primary)
                .padding(.vertical, 40)
                .padding(.horizontal, 15)
            }
        }
    }
    
    func topPicks() -> some View {
        VStack(alignment: .leading){
            Text("Made for You")
                .font(.subheadline)
                .foregroundStyle(.secondary)
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
        }
        .padding(.trailing, 5)
    }
}

#Preview {
    GeometryReader{ _ in
        HomeView()
    }
}
