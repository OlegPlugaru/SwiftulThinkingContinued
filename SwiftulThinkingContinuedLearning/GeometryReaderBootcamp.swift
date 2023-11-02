//
//  GeometryReaderBootcamp.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 02.11.2023.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray)
                            .overlay {
                                Image(systemName: "heart.circle.fill")
                                    .renderingMode(.original)
                                    .font(.system(size: 90))
                                    
                                    
                            }
                            .shadow(radius: 10)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                                      axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                            
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
        
        //        GeometryReader { geometry in
        //            HStack(spacing: 0) {
        //                Rectangle()
        //                    .fill(Color.red)
        //                    .frame(width: geometry.size.width * 0.6666)
        //                Rectangle().fill(Color.blue)
        //            }
        //            .ignoresSafeArea()
        //        }
        
    }
}

#Preview {
    GeometryReaderBootcamp()
}
