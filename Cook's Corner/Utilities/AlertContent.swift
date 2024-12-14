//
//  AlertContent.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import Foundation

struct AlertContent: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let message: String
}
