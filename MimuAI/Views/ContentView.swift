//
//  ContentView.swift
//  MimuAI
//
//  Created by Duy Nguyen on 1/3/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TranslatorView()
                .tabItem {
                    Label("Translator", systemImage: "waveform")
                }
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
            SettingsView()
                .tabItem {
                    Label("Settings",
                          systemImage: "person")}
        }
    }
}

#Preview {
    ContentView()
}


