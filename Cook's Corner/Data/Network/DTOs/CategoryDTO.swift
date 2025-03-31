//
//  Category.swift
//  Cook's Corner
//
//  Created by KhuePM on 11/12/24.
//

import Foundation

struct CategoryDTO: Codable {
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
}

struct CategoryResponse: Codable {
    let categories: [CategoryDTO]
}
