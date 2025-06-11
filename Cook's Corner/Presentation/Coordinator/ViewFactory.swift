//
//  ViewFactory.swift
//  Cook's Corner
//
//  Created by KhuePM on 6/6/25.
//

import Foundation
import SwiftUI

final class ViewFactory {
    static func makeView(for route: Route, dependencyContainer: DependencyContainer) -> AnyView {
        switch route {
        case .home:
            return AnyView(dependencyContainer.makeHomeView())
        case .mealDetail(let meal):
            return AnyView(dependencyContainer.makeMealDetailViewForRecipe(for: meal))
        case .mealSaved:
            return AnyView(dependencyContainer.makeMealsSavedView())
        case .youtube(let meal):
            return AnyView(dependencyContainer.makeYoutubeView(for: meal))
        case .searchResult(let name):
            return AnyView(dependencyContainer.makeSearchView(for: name))
        case .mealSavedDetail(let meal):
            return AnyView(dependencyContainer.makeMealDetailViewForLocalData(for: meal))
        }
    }
}
