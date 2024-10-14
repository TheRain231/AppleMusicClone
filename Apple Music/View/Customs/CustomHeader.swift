//
//  CustomHeader.swift
//  Apple Music
//
//  Created by Андрей Степанов on 14.10.2024.
//

import SwiftUI

struct CustomHeader {
    static func header(_ text: String) -> some View {
        VStack{
            Rectangle()
                .foregroundStyle(.clear)
                .frame(height: 10)
            HStack{
                Text(text)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Spacer()
                
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
            //здеась еще visualEffect на увелечение
        }
        
    }
    
    static func overlay(_ text: String, _ scrollPos: CGFloat, editButton: Bool = false) -> some View {
        ZStack {
            
            VStack{
                ZStack{
                    Rectangle()
                        .fill(.ultraThickMaterial)
                        .fill(Color(uiColor: UIColor.systemBackground).opacity(scrollPos > 40 ? 0 : 1))
                        .animation(.easeInOut, value: scrollPos > 40)
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 25)
                    
                    
                    Text(text)
                        .fontWeight(.semibold)
                        .offset(y: -5)
                        .opacity(scrollPos >= 30 ? 1 : 0)
                    
                    
                }
                .offset(y: scrollPos > 1 ? min(-10 + scrollPos / 3, 0) : -10)
                Spacer()
            }
            if editButton{
                VStack{
                    HStack{
                        Spacer()
                        Button{
                            
                        } label: {
                            Text("Edit")
                                .offset(x: -15, y: -5)
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}

private struct headerPrewiew: View {
    @State private var scrollPos: CGFloat = 0
    @State private var isScrolling: Bool = false
    private var matched = Namespace().wrappedValue
    
    var body: some View {
        ScrollView() {
            VStack(){
                ForEach(0..<100) { _ in
                    Rectangle()
                        .frame(width: 40, height: 20)
                    }
            }
            
            .scrollTargetBehavior(.viewAligned)
            .safeAreaInset(edge: .top) {
                CustomHeader.header("Home")
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
            CustomHeader.overlay("Home", scrollPos, editButton: false)
        }
    }
}

#Preview {
    headerPrewiew()
}
