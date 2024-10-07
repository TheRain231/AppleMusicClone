//
//  PageNumber.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import Foundation
import SwiftUI

enum PageNumber: Int{
    case home = 0, new, radio, library, search
}

@Observable
class PageNumberStore: ObservableObject{
    public var pageNumber: PageNumber = .home
    
    init(_ pageNumber: PageNumber) {
        self.pageNumber = pageNumber
    }
    
    func setTo(_ pageNumber: PageNumber){
        self.pageNumber = pageNumber
    }
}
