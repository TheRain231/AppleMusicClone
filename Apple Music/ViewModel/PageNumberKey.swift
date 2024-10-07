//
//  Untitled.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//
import Foundation
import SwiftUI

extension EnvironmentValues{
    var pageNumber: PageNumberStore{
        get { self[PageNumberKey.self] }
        set { self[PageNumberKey.self] = newValue }
    }
}

private struct PageNumberKey: EnvironmentKey {
    static var defaultValue: PageNumberStore = .init(.home)
}
