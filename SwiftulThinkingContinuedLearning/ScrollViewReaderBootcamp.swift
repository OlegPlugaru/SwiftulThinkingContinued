//
//  ScrollViewReaderBootcamp.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 02.11.2023.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                }
                .padding(.horizontal)
                .keyboardType(.numberPad)
               
               
            
            Button("SCROLL NOW") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                       scrollToIndex = index
                    }
                  
                }
            }
            ScrollView {
                ScrollViewReader { proxy in
                    
                  
                    
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
