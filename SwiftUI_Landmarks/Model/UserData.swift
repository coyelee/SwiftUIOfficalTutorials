//
//  UserData.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-05.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    //
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    //
    
    var categories: [String : [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue}
        )
    }
}


