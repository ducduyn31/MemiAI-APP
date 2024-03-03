//
//  UserProfile.swift
//  MimuAI
//
//  Created by Giang Le on 3/3/2024.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        HStack {
            Image("Avatar6")
                .resizable()
                .frame(width:64,height:64)
                .clipShape(.circle)
                .padding()
            Text("Anna Lee")
                .font(.headline)
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(alignment: .leading)
            Spacer()
        }
    }
}
#Preview {
        UserProfile()
}
        
        
