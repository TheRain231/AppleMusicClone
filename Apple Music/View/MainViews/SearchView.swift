//
//  SearchView.swift
//  Apple Music
//
//  Created by Андрей Степанов on 07.10.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        CustomScrollView(title: "Search", hasSearch: true) {
            VStack(){
            }
        }
        .overlay{
            VStack{
                search
                    .offset(y: 25)
                Spacer()
            }
        }
    }
    
    var search: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Artists, Songs, Lyrics and More", text: $searchText, onEditingChanged: { isEditing in
                    withAnimation {
                        self.showCancelButton = true
                    }
                }, onCommit: {
                    print("onCommit")
                }).foregroundColor(.primary)
                
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
            if showCancelButton {
                Button("Cancel") {
                    UIApplication.shared.endEditing(true)
                    self.searchText = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
                .transition(
                    .move(edge: .trailing)
                    .combined(with: .opacity) // Добавляем fade-эффект
                )
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton)
        .animation(.default, value: showCancelButton) // Привязка анимации к состоянию

    }
}

#Preview {
    SearchView()
}

extension UIApplication {
    /// Resigns the keyboard.
    ///
    /// Used for resigning the keyboard when pressing the cancel button in a searchbar based on [this](https://stackoverflow.com/a/58473985/3687284) solution.
    /// - Parameter force: set true to resign the keyboard.
    func endEditing(_ force: Bool) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
