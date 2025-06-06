//
//  Route.swift
//  Cook's Corner
//
//  Created by KhuePM on 4/6/25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case home
    case mealDetail(Meal)
    case searchResult(String)
    case youtube(Meal)
    case mealSaved
    case mealSavedDetail(Meal)
}

enum NavigationDirection {
    case push, pop
}
