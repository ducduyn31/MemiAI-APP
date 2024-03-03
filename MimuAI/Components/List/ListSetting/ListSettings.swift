//
//  ListSettings.swift
//  MimuAI
//
//  Created by Giang Le on 3/3/2024.
//

import SwiftUI

struct ListSettings: View {
    var setting: [ListSettingSession] = []
    
    var body: some View {
            ForEach(setting) { ListSettingSession in
                ListSettingItem(session: ListSettingSession)
        }
    }
}

#Preview {
    ListSettings(setting: [
        ListSettingSession(imageName: "person.crop.circle", titleMessage: "Account"),
        ListSettingSession(imageName: "hand.thumbsup.circle", titleMessage: "Subscriptions"),
        ListSettingSession(imageName: "note.text", titleMessage: "Privacy & Policies"),
        ListSettingSession(imageName: "exclamationmark.circle.fill", titleMessage: "About Memu"),
    ])
}
