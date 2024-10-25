//
//  RadioView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        CustomScrollView(title: "Radio") {
            radioTab()
            
            hitsTab()
        }
    }
    
    @ViewBuilder
    func radioTab() -> some View {
        VStack(){
            HStack{
                VStack(alignment: .leading){
                    Text("\(Image(systemName: "apple.logo"))Music 1")
                        .font(.title)
                        .bold()
                    Text("The new music you'll love")
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "calendar")
                        .padding(10)
                        .background(in: Circle())
                        .backgroundStyle(.bar)
                }
            }
            .padding(.horizontal)
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Gradient(colors: [
                        Color(red: 200/255, green: 150/255, blue: 80/255),
                        Color(red: 220/255, green: 180/255, blue: 90/255),
                        Color(red: 130/255, green: 90/255, blue: 40/255),
                        Color(red: 220/255, green: 180/255, blue: 90/255)]))
                    .frame(width: 370, height: 350)
                VStack{
                    Spacer()
                    
                    Text("Today's\nHits")
                        .font(.system(size: 60))
                        .bold()
                        .foregroundStyle(
                            LinearGradient(
                            colors: [
                                Color(red: 250/255, green: 250/255, blue: 150/255),
                                Color(red: 250/255, green: 250/255, blue: 150/255),
                                Color(red: 250/255, green: 250/255, blue: 150/255),
                                Color(red: 50/255, green: 50/255, blue: 30/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255),
                                Color(red: 0/255, green: 0/255, blue: 0/255)],
                            startPoint: .top,
                            endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .black.opacity(0.6), radius: 0.1, x: 2, y: 2)
                    
                    Spacer()
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 115/255, green: 80/255, blue: 30/255))
                            .frame(width: 370, height: 120)
                        HStack{
                            VStack(alignment: .leading) {
                                Text("LIVE • 22:00–23:00")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white.opacity(0.8))
                                
                                Text("Today's Hits")
                                    
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text("The biggest songs in pop, hip-hop, R&B, and more.")
                                    .font(.callout)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "play.fill")
                                    .padding(10)
                                    .background(in: Circle())
                                    .backgroundStyle(.secondary.opacity(0.2))
                            }
                            .foregroundStyle(.bar)
                        }
                        .padding()
                        .frame(width: 370, height: 120)
                    }
                } .mask {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 370, height: 350)
                }
            }
            
        }
        
    }
    
    @ViewBuilder
    func hitsTab() -> some View {
        VStack(){
            HStack{
                VStack(alignment: .leading){
                    Text("\(Image(systemName: "apple.logo"))Music Hits")
                        .font(.title)
                        .bold()
                    Text("Songs you know and love")
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "calendar")
                        .padding(10)
                        .background(in: Circle())
                        .backgroundStyle(.bar)
                }
            }
            .padding(.horizontal)
            ZStack{
                Image("EstelleShow")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 370, height: 350)
                    .mask {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 370, height: 350)
                    }
                
                VStack{

                    Spacer()
                    
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 115/255, green: 80/255, blue: 130/255))
                            .frame(width: 370, height: 120)
                        HStack{
                            VStack(alignment: .leading) {
                                Text("LIVE • 22:00–23:00")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white.opacity(0.8))
                                
                                Text("Daytime Hype")
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text("The smallest songs in pop, hip-hop, R&B, and more.")
                                    .font(.callout)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "play.fill")
                                    .padding(10)
                                    .background(in: Circle())
                                    .backgroundStyle(.secondary.opacity(0.2))
                            }
                            .foregroundStyle(.bar)
                        }
                        .padding()
                        .frame(width: 370, height: 120)
                    }
                    
                        
                } .mask {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 370, height: 350)
                }
            }
            
        }
    }

}

#Preview {
    RadioView()
}
