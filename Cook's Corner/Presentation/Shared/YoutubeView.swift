//
//  YoutubeView.swift
//  Cook's Corner
//
//  Created by KhuePM on 14/12/24.
//

import SwiftUI
import WebKit
import YouTubePlayerKit

struct YoutubeView: View {

    // MARK:  Property
    @Environment(\.presentationMode) var presentation
    var strYoutube: String?

    // MARK:  Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.gray)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                })

                Spacer()
            }
            .padding(.horizontal)

            Spacer()

            YouTubePlayerView(YouTubePlayer(
                source: .url(self.strYoutube ?? ""),
                configuration: .init(
                    autoPlay: true,
                    showControls: true,
                    showFullscreenButton: true

                )
            ))
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .padding(.vertical)

            Spacer()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    YoutubeView()
}
