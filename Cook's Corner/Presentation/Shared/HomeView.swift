//
//  HomeView.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import SwiftUI

struct HomeView: View {
    // MARK:  Property
    @StateObject var viewmodel: MealViewModel
    @State var name = ""
    @State var selectedCategory = "Beef"
    @State var selectedIndex = 1
    @Namespace var animation
    @State var showSearchResult = false
    @State var showSavedMeal = false

    // MARK:  Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                headerView

                Divider()
                    .padding(.top, 8)

                ScrollView(.vertical, showsIndicators: true) {
                    searchView
                    categoriesView
                    CategoryRecipesView(viewmodel: viewmodel)
                }
            }
            .navigationBarHidden(true)
        }
        .fullScreenCover(isPresented: $showSavedMeal) {
            NavigationStack{
            MealSavedView(mealViewModel: viewmodel)
            }
        }
        .onChange(of: self.selectedCategory) {oldValue, newValue in
            viewmodel.getMealsByCategory(category: newValue)
        }
        .task {
            viewmodel.getMealsByCategory(category: self.selectedCategory)
        }
        .alert(item: $viewmodel.alert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK")) {
                    viewmodel.alert = nil
                }
            )
        }
    }
}

extension HomeView {
    // MARK:  headerView
    private var headerView: some View {
        ZStack {
            HStack {

                Spacer()

                Button(action: {
                    // MARK:  Todo
                    showSavedMeal.toggle()
                }, label: {
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(Color.green)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .background(Circle().strokeBorder(Color.gray.opacity(0.3), lineWidth: 1))
                })
            }
            .padding(.horizontal)

            HStack(spacing: 0) {
                Text("Chef's ")
                    .font(.system(size: 27, weight: .bold))

                Text("kitchen")
                    .font(.system(size: 27))
            }
        }
    }

    private var searchView: some View {
        VStack(alignment: .leading) {
            Text("What do you want to\ncook today?")
                .font(.system(size: 27, weight: .bold))
                .padding(.top, 30)
                .padding(.leading)

            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 27, weight: .bold))
                    .foregroundColor(.gray)

                TextField("Try 'Salad'",
                          text: $name,
                          onCommit: {
                    showSearchResult = true
                    self.name = ""
                })
                .font(.system(size: 21))
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray.opacity(0.3), lineWidth: 1))
            .padding(.top)
            .padding(.horizontal)
            .navigationDestination(isPresented: $showSearchResult, destination: {SearchView(mealViewModel: viewmodel, name: $name)})

        }
    }

    private var categoriesView: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(viewmodel.categories, id: \.self.idCategory){ category in
                        Button(action: {
                            withAnimation {
                                selectedIndex = Int(category.idCategory ?? "1") ?? 1
                                selectedCategory = category.strCategory ?? "Beef"
                                viewmodel.getMealsByCategory(category: selectedCategory)
                            }
                        }, label: {
                            VStack {
                                Text(category.strCategory ?? "")
                                    .font(.system(size: selectedCategory == category.strCategory ? 19 : 17, weight:  selectedCategory == category.strCategory ? .bold : .regular))
                                    .foregroundColor(selectedCategory == category.strCategory ? .black : .gray)

                                ZStack {
                                    if selectedCategory == category.strCategory {
                                        Capsule()
                                            .fill(Color(#colorLiteral(red: 0.02946649678, green: 0.6407182813, blue: 0.3381308317, alpha: 1)))
                                            .frame(height: 4)
                                            .matchedGeometryEffect(id: "category", in: animation)
                                    }
                                }
                            }
                        })
                    }
                }
                .padding(.horizontal)

            }
            .padding(.top)

            Divider()
        }
    }
}
