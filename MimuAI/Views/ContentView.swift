//
//  ContentView.swift
//  MimuAI
//
//  Created by Duy Nguyen on 1/3/2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    var body: some View {
        GlowButton(label: "Start") {
            print("Start")
            Task {
                await captureVideo()
            }
        }
    }
    
    var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            var isAuthorized = status == .authorized
            
            if !isAuthorized {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
    
    func captureVideo() async {
        guard await isAuthorized else {
            return
        }
    }
}

#Preview {
    ContentView()
}
