//
//  MealEntity.swift
//  Cook's Corner
//
//  Created by KhuePM on 13/12/24.
//

import Foundation
import RealmSwift

class MealEntity: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String?
    @Persisted var meal: String?
    @Persisted var mealThumb: String?
    @Persisted var category: String?
    @Persisted var instructions: String?
    @Persisted var stringYoutube: String?
    @Persisted var ingredient1: String?
    @Persisted var ingredient2: String?
    @Persisted var ingredient3: String?
    @Persisted var ingredient4: String?
    @Persisted var ingredient5: String?
    @Persisted var ingredient6: String?
    @Persisted var ingredient7: String?
    @Persisted var ingredient8: String?
    @Persisted var ingredient9: String?
    @Persisted var measure1: String?
    @Persisted var measure2: String?
    @Persisted var measure3: String?
    @Persisted var measure4: String?
    @Persisted var measure5: String?
    @Persisted var measure6: String?
    @Persisted var measure7: String?
    @Persisted var measure8: String?
    @Persisted var measure9: String?

    var mealThumbURL: URL? {
        get { mealThumb.flatMap {URL(string: $0)} }  // Convert to URL when accessed
        set { mealThumb = newValue?.absoluteString ?? "" }  // Convert URL to String before saving
    }

    convenience init(meal: String?, mealThumbURL: URL?, category: String?, instructions: String?, stringYoutube: String?, ingredient1: String?, ingredient2: String?, ingredient3: String?, ingredient4: String?, ingredient5: String?, ingredient6: String?, ingredient7: String?, ingredient8: String?, ingredient9: String?, measure1: String?, measure2: String?, measure3: String?, measure4: String?, measure5: String?, measure6: String?, measure7: String?, measure8: String?, measure9: String?) {
        self.init()
        self.meal = meal
        self.mealThumbURL = mealThumbURL
        self.category = category
        self.instructions = instructions
        self.stringYoutube = stringYoutube
        self.ingredient1 = ingredient1
        self.ingredient2 = ingredient2
        self.ingredient3 = ingredient3
        self.ingredient4 = ingredient4
        self.ingredient5 = ingredient5
        self.ingredient6 = ingredient6
        self.ingredient7 = ingredient7
        self.ingredient8 = ingredient8
        self.ingredient9 = ingredient9
        self.measure1 = measure1
        self.measure2 = measure2
        self.measure3 = measure3
        self.measure4 = measure4
        self.measure5 = measure5
        self.measure6 = measure6
        self.measure7 = measure7
        self.measure8 = measure8
        self.measure9 = measure9
    }
}

extension MealEntity: MealRepresentable {
    var idMeal: String? { id }
    var strMeal: String? { meal }
    var strCategory: String? { category }
    var strInstructions: String? { instructions }
    var strMealThumb: URL? { mealThumbURL }
    var strYoutube: String? { stringYoutube }

    func ingredient(at index: Int) -> String? {
        switch index {
        case 1: return ingredient1
        case 2: return ingredient2
        case 3: return ingredient3
        case 4: return ingredient4
        case 5: return ingredient5
        case 6: return ingredient6
        case 7: return ingredient7
        case 8: return ingredient8
        case 9: return ingredient9
        default: return nil
        }
    }

    func measure(at index: Int) -> String? {
        switch index {
        case 1: return measure1
        case 2: return measure2
        case 3: return measure3
        case 4: return measure4
        case 5: return measure5
        case 6: return measure6
        case 7: return measure7
        case 8: return measure8
        case 9: return measure9
        default: return nil
        }
    }
}
