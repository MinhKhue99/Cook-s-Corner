//
//  ErrorResponse.swift
//  Cook's Corner
//
//  Created by KhuePM on 11/12/24.
//

import Foundation

struct ErrorResponse: Codable, LocalizedError {
    let status: Int
    let error: String

    var errorDescription: String? {
        return NSLocalizedString(self.error, comment: "")
    }
}
