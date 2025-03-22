//
//  MealRepresentable.swift
//  Cook's Corner
//
//  Created by KhuePM on 22/3/25.
//

import Foundation

protocol MealRepresentable {
    var idMeal: String? { get }
    var strMeal: String? { get }
    var strCategory: String? { get }
    var strInstructions: String? { get }
    var strMealThumb: URL? { get }
    var strYoutube: String? { get }
    func ingredient(at index: Int) -> String?
    func measure(at index: Int) -> String?
}
