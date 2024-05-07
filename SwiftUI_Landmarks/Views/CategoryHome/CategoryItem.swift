//
//  CategoryItem.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-07.
//

import SwiftUI

struct CategoryItem: View {
    
    var  landmark: Landmark
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: landmarkData[0])
    }
}
