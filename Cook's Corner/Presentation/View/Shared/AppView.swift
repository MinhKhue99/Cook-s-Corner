//
//  AppView.swift
//  Cook's Corner
//
//  Created by KhuePM on 6/6/25.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    let dependencyContainer = DependencyContainer.shared
    var body: some View {
        NavigationView {
            ZStack {
                ViewFactory.makeView(for: coordinator.currentRoute, dependencyContainer: dependencyContainer)
            }
            .transition(coordinator.direction == .push ? .move(edge: .trailing) : .move(edge: .leading))
            .animation(.easeInOut, value: coordinator.currentRoute)
        }
        .navigationBarHidden(true) .sheet(isPresented: $coordinator.showFullScreenCover) { DependencyContainer.shared.makeMealsSavedView() }
    }
}

#Preview {
    AppView()
        .environmentObject(AppCoordinator())
}
