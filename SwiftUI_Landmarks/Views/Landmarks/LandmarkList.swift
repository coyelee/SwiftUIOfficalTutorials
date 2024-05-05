//
//  LandmarkList.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-04.
//

import SwiftUI

struct LandmarkList: View {
    // xxxx
    //
    @EnvironmentObject var userData: UserData
    //
    //@State private var showFavoritesOnly = false
    var filteredLandmarks: [Landmark] {
        userData.landmarks.filter { landmark in
            (!userData.showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
//        NavigationSplitView {
//            List(landmarkData) { landmark in
//                NavigationLink {
//                    LandmarkDetail(landmark: landmark)
//                } label: {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
//            .navigationTitle("Landmarks")
//        } detail: {
//            Text("Select a Landmark")
//        }
        
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            //.previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .environmentObject(UserData())
        
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//                    LandmarkList()
//                        .previewDevice(PreviewDevice(rawValue: deviceName))
//                        .previewDisplayName(deviceName)
//        }
    }
}
