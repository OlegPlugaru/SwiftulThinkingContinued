//
//  BackgorundThreadBootcamp.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 05.11.2023.
//

import SwiftUI

class BackgorundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("CHECK 1: \(Thread.isMainThread)")
            print("CHECK 1: \(Thread.current)")
            DispatchQueue.main.async {
                self.dataArray = newData
                print("CHECK 1: \(Thread.isMainThread)")
                print("CHECK 1: \(Thread.current)")
            }
        }
        
       
    }
    
   private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgorundThreadBootcamp: View {
    
    @StateObject var vm = BackgorundThreadViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    BackgorundThreadBootcamp()
}
