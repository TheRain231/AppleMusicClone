//
//  Untitled.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

class Tab{
    let tab: PageNumber
    let title: String
    let imageName: String
    
    init(_ tab: PageNumber, title: String, imageName: String) {
        self.tab = tab
        self.title = title
        self.imageName = imageName
    }
}

extension Tab: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(tab)
        hasher.combine(title)
        hasher.combine(imageName)
    }
    
    static func ==(lhs: Tab, rhs: Tab) -> Bool {
        return lhs.tab == rhs.tab
    }
}
