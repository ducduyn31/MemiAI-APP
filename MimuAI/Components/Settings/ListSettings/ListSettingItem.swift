//
//  ListSettingItem.swift
//  MimuAI
//
//  Created by Giang Le on 3/3/2024.
//

import SwiftUI

enum SettingScreen {
    case account
    case subscription
    case privacy
    case about
}



struct ListSettingSession: Identifiable {
    var id = UUID()
    let imageName: String
    let titleMessage: String
    let screen: SettingScreen
    
    @ViewBuilder
    func getScreen() -> some View {
        switch screen {
        case .account:
            EditAccountView()
        case .subscription:
            SubscriptionView()
        case .privacy:
            EditAccountView()
        case .about:
            AboutView()
        }
    }
    
}

struct ListSettingItem: View {
    var session: ListSettingSession? = nil
    let itemHeight = 100.0
    
    var body: some View {
        CustomNavLink (
            title: session?.titleMessage ?? "title",
            destination: session?.getScreen	()
        ){
            
            ZStack {
                Rectangle()
                    .opacity(0)
                    .frame(height: itemHeight)
                    .padding()
                
                HStack {
                    Image(systemName: session?.imageName ?? "person.crop.circle")
                        .foregroundColor(.blue)
                        .frame(width: 24, height: 24)
                        .padding()
                    Text(session?.titleMessage ?? "Account")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .lineLimit(1)
                        .frame(width: 300, alignment: .leading)
                    Image (systemName:"control")
                        .rotationEffect(.degrees(90))
                    Spacer()
                }
                Spacer()
            }
            .frame(height: itemHeight)
        }
    }
}

#Preview {
    ListSettingItem()
}
