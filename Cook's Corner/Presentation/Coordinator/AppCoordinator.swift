//
//  AppCoordinator.swift
//  Cook's Corner
//
//  Created by KhuePM on 25/3/25.
//

import SwiftUI

final class AppCoordinator: Coordinator {
    @Published var currentRoute: Route = .home
    @Published var showFullScreenCover = false
    @Published var navigationStack: [Route] = []
    @Published var direction: NavigationDirection = .push

    func push(_ route: Route) {
        navigationStack.append(currentRoute)
        direction = .push
        currentRoute = route
    }

    func pop() {
        guard let previous = navigationStack.popLast() else { return }
        direction = .pop
        currentRoute = previous
    }

    func popToRoot() {
        navigationStack.removeAll()
        direction = .pop
        currentRoute = .home
    }

    func dismissFullScreen() {
        showFullScreenCover = false
    }
}
