//
//  HomeView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView() {
                HStack{
                    Text("Top picks for you")
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal) {
                    topPicks()
                }
            }
            .navigationTitle("Home")
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
                        .overlay{
                            Text("КИТЧ, Tell Me a Fairytale, Монеточка, Noize MC, MORGENSHTERN")
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
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
        .padding(.horizontal)
    }
}

#Preview {
    GeometryReader{ _ in
        HomeView()
    }
}
