//
//  ContentView.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem() {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
                .environmentObject(ModelData())
            
            LandmarkList()
                .tabItem() {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
                .environmentObject(ModelData())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
