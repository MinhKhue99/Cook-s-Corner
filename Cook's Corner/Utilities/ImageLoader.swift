//
//  CachedAsyncImage.swift
//  Cook's Corner
//
//  Created by KhuePM on 30/4/25.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private static let cache = NSCache<NSURL, UIImage>()
    private var cancellable: AnyCancellable?

    func load(from url: URL) {
        if let cachedImage = ImageLoader.cache.object(forKey: url as NSURL) {
            self.image = cachedImage
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] downloadedImage in
                guard let self = self, let image = downloadedImage else { return }
                ImageLoader.cache.setObject(image, forKey: url as NSURL)
                self.image = image
            }
    }

    func cancel() {
        cancellable?.cancel()
    }
}
