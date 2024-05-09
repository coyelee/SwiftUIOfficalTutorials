//
//  CategoryHome.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-06.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: {self.showingProfile.toggle()}) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                /*modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())*/
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            //.navigationBarItems(trailing: profileButton)
            .toolbar() {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
                //Text("LI")
            }
            .sheet(isPresented: $showingProfile) {
                //Text("User Profile")
                ProfileHost()
                    .environmentObject(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
