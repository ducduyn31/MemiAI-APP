//
//  CameraView.swift
//  MimuAI
//
//  Created by Duy Nguyen on 2/3/2024.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewRepresentable {
    func makeUIView(context: Context) -> VideoCaptureView {
        let previewView = VideoCaptureView()
        previewView.session = AVCaptureSession()
        return previewView
    }
    
    func updateUIView(_ uiView: CameraViewController, context: Context) {
        
    }
}

#Preview {
    CameraView()
}
