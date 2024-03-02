//
//  HistoryView.swift
//  MimuAI
//
//  Created by Giang Le on 2/3/2024.
//

import SwiftUI

struct HistoryView: View {
    
    let mockHistory: [HistorySession] = [
        HistorySession(imagePath: "Avatar1", lastTime: "18:31", lastMessage: "Can I have a bottle of water"),
        HistorySession(imagePath: "Avatar1", lastTime: "18:31", lastMessage: "Can I have a bottle of water"),
        HistorySession(imagePath: "Avatar1", lastTime: "18:31", lastMessage: "Can I have a bottle of water"),
        HistorySession(imagePath: "Avatar1", lastTime: "18:31", lastMessage: "Can I have a bottle of water"),
        HistorySession(imagePath: "Avatar1", lastTime: "18:31", lastMessage: "Can I have a bottle of water"),
    ]
    
    var body: some View {
        ZStack {
            VStack {
                HistoryList(history: mockHistory)
            }
            .padding(.top, 100)
            Title(label: "Translation History")
                .position(x: 196)
        }
        
    }
}

 #Preview {
    HistoryView()
}
