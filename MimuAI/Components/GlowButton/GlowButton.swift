//
//  GlowButton.swift
//  MimuAI
//
//  Created by Duy Nguyen on 2/3/2024.
//

import SwiftUI

struct GlowButton: View {
    @State private var isGlowing = false
    var label: String = ""
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
                    ZStack {
                        Circle()
                            .frame(width: 160, height: 160)
                            .foregroundColor(.blue)
                            .overlay(
                                Circle()
                                    .stroke(.blue, lineWidth: 4)
                                    .scaleEffect(isGlowing ? 1.5 : 1)
                                    .opacity(isGlowing ? 0 : 1)
                                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false), value: isGlowing)
                            )
                            Text(label)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                    }
                }
                .onAppear {
                    isGlowing = true
                }
    }
}

#Preview {
    GlowButton()
}
