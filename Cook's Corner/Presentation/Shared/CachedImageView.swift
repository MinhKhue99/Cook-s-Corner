//
//  CachedImageView.swift
//  Cook's Corner
//
//  Created by KhuePM on 30/4/25.
//

import SwiftUI

struct CachedImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL
    var placeholder: Image

    init(url: URL, placeholder: Image = Image(systemName: "photo")) {
        self.url = url
        self.placeholder = placeholder
    }

    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                placeholder
                    .resizable()
                    .onAppear { loader.load(from: url) }
            }
        }
    }
}
