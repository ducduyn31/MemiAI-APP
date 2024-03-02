//
//  VideoCaptureTypes.swift
//  MimuAI
//
//  Created by Duy Nguyen on 2/3/2024.
//

import Foundation

enum SessionSetupStatus {
    case success
    case notAuthorized
    case configurationFailed
}

enum VideoCaptureError: Error {
    case cannotAddInput
    case cannotAddOutput
    case defaultDeviceNotExist
}
