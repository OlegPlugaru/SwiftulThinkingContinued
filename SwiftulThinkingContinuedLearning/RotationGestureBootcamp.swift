//
//  RotationGesture.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 31.10.2023.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding(50)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded({ value in
                        withAnimation(.spring) {
                            angle = Angle(degrees: 0)
                        }
                    })
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
