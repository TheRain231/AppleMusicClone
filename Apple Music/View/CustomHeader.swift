//
//  CustomHeader.swift
//  Apple Music
//
//  Created by Андрей Степанов on 14.10.2024.
//

import SwiftUI

struct CustomHeader {
    static func header() -> some View {
        HStack{
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(.circle)
            }
        }
        .foregroundStyle(.primary)
        .padding(15)
        //здеась еще visualEffect на увелечение
    }
    
    static func overlay(_ scrollPos: CGFloat) -> some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(.ultraThickMaterial)
                    .fill(Color(uiColor: UIColor.systemBackground).opacity(scrollPos > 40 ? 0 : 1))
                    .animation(.easeInOut, value: scrollPos > 40)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 25)
                
                
                Text("Home")
                    .fontWeight(.semibold)
                    .offset(y: -5)
                    .opacity(scrollPos >= 30 ? 1 : 0)
            }
            .offset(y: scrollPos > 1 ? min(-10 + scrollPos / 3, 0) : -10)
            Spacer()
        }
    }
}
