//
//  CustomHeader.swift
//  Apple Music
//
//  Created by Андрей Степанов on 14.10.2024.
//

import SwiftUI

struct CustomHeader {
    private static let opacityOffset = 40.0
    
    static func header(_ text: String, _ scrollPos: CGFloat, editButton: Bool = false) -> some View {
        VStack{
            Rectangle()
                .foregroundStyle(.clear)
                .frame(height: 15)
            HStack{
                Text(text)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Spacer()
                
                if editButton{
                    Button{
                        
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25)
                            .clipShape(.circle)
                    }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .clipShape(.circle)
                }
            }
            .foregroundStyle(.primary)
            .padding(15)
            //здесь еще visualEffect на увелечение
        }
        .opacity(scrollPos >= opacityOffset ? 0 : 1)
    }
    
    static func overlay(_ text: String, _ scrollPos: CGFloat, hasSearch: Bool = false) -> some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(.regularMaterial)
                    .ignoresSafeArea(edges: .top)
                VStack{
                    Text(text)
                        .fontWeight(.semibold)
                        .offset(y: -5)
                        .frame(maxHeight: .infinity, alignment: .top)
                }
            }
            .frame(height: hasSearch ? 75 : 25)
            .opacity(scrollPos >= opacityOffset ? 1 : 0)
            .offset(y: scrollPos > 1 ? min(-10 + scrollPos / 3, 0) : -10)
            Spacer()
        }
        
    }
}

fileprivate struct headerPrewiew: View {
    @State private var scrollPos: CGFloat = 0
    @State private var isScrolling: Bool = false
    private var matched = Namespace().wrappedValue
    
    var body: some View {
        ScrollView() {
            VStack(){
                ForEach(0..<100) { _ in
                    Rectangle()
                        .fill(Color(red: CGFloat.random(in: 0..<1), green: CGFloat.random(in: 0..<1), blue: CGFloat.random(in: 0..<1)))
                        .frame(width: 200, height: 60)
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaInset(edge: .top) {
                CustomHeader.header("Home", scrollPos, editButton: true)
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
            CustomHeader.overlay("Home", scrollPos, hasSearch: true)
        }
    }
}

#Preview {
    headerPrewiew()
}
