//
//  VideoCaptureService.swift
//  MimuAI
//
//  Created by Duy Nguyen on 2/3/2024.
//

import Foundation
import AVFoundation

class VideoCaptureService {
    
    private let captureSession = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    private var setupStatus = SessionSetupStatus.success
    
    private let sessionQueue = DispatchQueue(label: "session.queue")
    private let videoOutputQueue = DispatchQueue(label: "video.output.queue")
    
    func requestPermissionIfNeeded() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                return
            case .notDetermined:
                sessionQueue.suspend()
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if !granted {
                        self.setupStatus = .notAuthorized
                    }
                    self.sessionQueue.resume()
                }
            default:
                self.setupStatus = .notAuthorized
        }
    }
    
    private func assignDevice() throws {
        do {
            var defaultVideoDevice: AVCaptureDevice?
            
            if let dualCameraDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
                defaultVideoDevice = dualCameraDevice
            } else if let dualWideCameraDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) {
                defaultVideoDevice = dualWideCameraDevice
            } else if let backCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
                defaultVideoDevice = backCameraDevice
            } else if let frontCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
                defaultVideoDevice = frontCameraDevice
            }
            
            guard let videoDevice = defaultVideoDevice else {
                print("Default video device is unavailable.")
                setupStatus = .configurationFailed
                captureSession.commitConfiguration()
                
                throw VideoCaptureError.defaultDeviceNotExist
            }
            
            let videoDeviceInput = try AVCaptureDeviceInput(device: videoDevice)
            
            if captureSession.canAddInput(videoDeviceInput) {
                captureSession.addInput(videoDeviceInput)
            } else {
                setupStatus = .configurationFailed
                captureSession.commitConfiguration()
                
                throw VideoCaptureError.cannotAddInput
            }
        } catch {
            setupStatus = .configurationFailed
            captureSession.commitConfiguration()
            
            throw error
        }
    }
    
    private func setOutput() throws {
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        } else {
            setupStatus = .configurationFailed
            captureSession.commitConfiguration()
            
            throw VideoCaptureError.cannotAddOutput
        }
    }
    
    private func configureSession() {
        guard setupStatus == .success else { return }
        
        captureSession.beginConfiguration()
        
        if captureSession.canSetSessionPreset(.iFrame1280x720) {
            captureSession.sessionPreset = .iFrame1280x720
        }
        
        do {
            try assignDevice()
            try setOutput()
            
            if let connection = captureSession.connections.first {
                // Set video orientation to portrait
                
            }
        } catch {
            print("error ocurred : \(error.localizedDescription)")
            return
        }
        
        captureSession.commitConfiguration()
    }
    
    private func startSessionIfPossible() {
        switch self.setupStatus {
        case .success:
            captureSession.startRunning()
        case .notAuthorized:
            print("camera usage not authorized")
        case .configurationFailed:
            print("configuration failed")
        }
    }
    
    func startSession() {
        sessionQueue.async {
            self.requestPermissionIfNeeded()
        }
        
        sessionQueue.async {
            self.configureSession()
        }
        
        sessionQueue.async {
            self.startSessionIfPossible()
        }
    }
    
    func setVideoOutputDelegate(with delegate: AVCaptureVideoDataOutputSampleBufferDelegate) {
        // AVCaptureVideoDataOutput has a method named 'setSampleBufferDelegate' which set the object
        // to receive raw picture data
        videoOutput.setSampleBufferDelegate(delegate, queue: videoOutputQueue)
    }
}
