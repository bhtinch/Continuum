//
//  PostError.swift
//  Continuum
//
//  Created by Benjamin Tincher on 2/7/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation

enum PostError: LocalizedError {
    case recordError
    case unableToUnwrap
    
    var errorDescription: String? {
        switch self {
        case .recordError:
            return "Error creating CKRecord"
        case .unableToUnwrap:
            return "Error unwrapping optional value"
        }
    }
}
