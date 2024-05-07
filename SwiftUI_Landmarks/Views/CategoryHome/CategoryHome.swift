//
//  CategoryHome.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-06.
//

import SwiftUI

struct CategoryHome: View {
    
    //@EnvironmentObject var modelData: ModelData
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(userData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            //.environmentObject(ModelData())
            .environmentObject(UserData())
    }
}
