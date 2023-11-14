//
//  ArraysBootcamp.swift
//  SwiftulThinkingContinuedLearning
//
//  Created by Oleg Plugaru on 04.11.2023.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
      
        // sort
        /*
       filteredArray = dataArray.sorted { (user1, user2) -> Bool in
            return user1.points > user2.points
        }
        
        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
         
         */
        
        // filter
        /*
        filteredArray = dataArray.filter({ user in
            return user.isVerified
        })
        
        filteredArray = dataArray.filter( {$0.isVerified })
        */
       
        // map
        /*
        mappedArray = dataArray.map({ user -> String in
            return user.name ?? "ERROR"
        })
        
        mappedArray = dataArray.map({ $0.name })
        
        mappedArray = dataArray.compactMap({ user in
            return user.name
        })
        
        mappedArray = dataArray.compactMap({ $0.name })
         */
        
//        let sort = dataArray.sorted(by: { $0.points > $1.points })
//        let filter = dataArray.filter({ $0.isVerified })
//        let map = dataArray.compactMap( {$0.name })
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified})
            .compactMap({ $0.name })
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Oleg", points: 5, isVerified: true)
        let user2 = UserModel(name: "Nick", points: 10, isVerified: true)
        let user3 = UserModel(name: nil, points: 20, isVerified: false)
        let user4 = UserModel(name: "Joe", points: 50, isVerified: true)
        let user5 = UserModel(name: "Emily", points: 35, isVerified: false)
        let user6 = UserModel(name: "Samantha", points: 32, isVerified: true)
        let user7 = UserModel(name: nil, points: 75, isVerified: false)
        let user8 = UserModel(name: "Sarah", points: 76, isVerified: false)
        let user9 = UserModel(name: "Amanda", points: 1, isVerified: true)
        let user10 = UserModel(name: "Steve", points: 100, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(.blue)
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
