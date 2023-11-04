//
//  HashableBootcamp.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 04.11.2023.
//

import SwiftUI

struct MyCustomModel: Hashable {
   // let id = UUID().uuidString
    let title: String
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four"),
        MyCustomModel(title: "Five")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
//                
//                ForEach(data) { item in
//                    Text(item.title)
//                        .font(.headline)
//                }
                
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
