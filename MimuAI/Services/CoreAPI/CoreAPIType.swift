//
//  CoreAPIType.swift
//  MimuAI
//
//  Created by Duy Nguyen on 2/3/2024.
//

import Foundation

enum CoreAPIError: Error {
    case noData
}

struct FacialAuthenticationResponse: Decodable {
    let success: Bool
    let message: String
}
