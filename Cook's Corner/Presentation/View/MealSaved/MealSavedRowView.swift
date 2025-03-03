//
//  MealSavedRowView.swift
//  Cook's Corner
//
//  Created by KhuePM on 3/3/25.
//

import SwiftUI

struct MealSavedRowView: View {
    let meal: MealEntity
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(meal.meal ?? "")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.black)
                    .redacted(reason: meal.meal == nil ? .placeholder : .init())
                    .lineLimit(1)

                Text(meal.category ?? "")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.gray)
                    .redacted(reason: meal.category == nil ? .placeholder : .init())

            }
            .padding(.top)
            .padding(.leading)

            Spacer()

            ZStack(alignment: .topTrailing) {
                AsyncImage(url: meal.mealThumbURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .redacted(reason: meal.mealThumb == nil ? .placeholder : .init())
                        .frame(maxWidth: 100, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 30)
    }
}
