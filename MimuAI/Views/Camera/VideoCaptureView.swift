//
//  VideoCaptureView.swift
//  MimuAI
//
//  Created by Duy Nguyen on 2/3/2024.
//

import SwiftUI
import AVFoundation

struct VideoCaptureView: UIView {
    var session: AVCaptureSession? {
        get {
            return videoLayer.session
        }
        set {
            videoLayer.session = newValue
        }
    }
    
    private var videoLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}
