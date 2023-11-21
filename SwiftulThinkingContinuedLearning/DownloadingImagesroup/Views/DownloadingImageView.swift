//
//  DownloadingImageView.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 21.11.2023.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }

    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    DownloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
        .frame(width: 75, height: 75)
        .previewLayout(.sizeThatFits)
}