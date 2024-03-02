//
//  Title.swift
//  MimuAI
//
//  Created by Giang Le on 2/3/2024.
//

import SwiftUI

struct Title: View {
    var label: String = ""
    
    var body: some View {
        ZStack {
            UnevenRoundedRectangle()
                .fill(.blue)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 60,
                        bottomTrailingRadius: 60,
                        topTrailingRadius: 0
                    )
                )
            VStack {
                Spacer()
                HStack {
                    Text(label)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                .padding()
            }
        }
        .frame(maxHeight: 170)
    }
}

#Preview {
    Title(label: "Title")
}
