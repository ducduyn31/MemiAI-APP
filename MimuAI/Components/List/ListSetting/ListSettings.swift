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
        ListSettingSession(imageName: "person.crop.circle", titleMessage: "Account", screen: .account),
        ListSettingSession(imageName: "hand.thumbsup.circle", titleMessage: "Subscriptions", screen: .subscription),
        ListSettingSession(imageName: "note.text", titleMessage: "Privacy & Policies", screen: .privacy),
        ListSettingSession(imageName: "exclamationmark.circle.fill", titleMessage: "About Memu", screen: .about),
    ])
}
