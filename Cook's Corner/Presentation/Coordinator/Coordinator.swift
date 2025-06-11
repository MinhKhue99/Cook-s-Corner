//
//  Coordinator.swift
//  Cook's Corner
//
//  Created by KhuePM on 25/3/25.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    func push(_ route: Route)
       func pop()
       func popToRoot()
       func dismissFullScreen()
}
