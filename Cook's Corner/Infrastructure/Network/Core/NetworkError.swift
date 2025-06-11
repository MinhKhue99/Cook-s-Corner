//
//  NetworkError.swift
//  Cook's Corner
//
//  Created by KhuePM on 29/5/25.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case encodingError(Error)
    case serverError(Int)
    case unknown

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .encodingError(let error):
            return "Encoding error: \(error.localizedDescription)"
        case .serverError(let errorCode):
            return "Server error with error code \(errorCode.description)"
        case .unknown:
            return "Unknown Error"
        }
    }
}
