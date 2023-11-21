//
//  DownlodingImagesBootcamp.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 21.11.2023.
//

import SwiftUI

// Codable
// background threads
// weak self
// Combine
// Publishers and Subscribers
// FileManager
// NSCache

struct DownlodingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                   DownloadingImagesRow(model: model)
                }
                
            }
            .listStyle(.inset)
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownlodingImagesBootcamp()
}
