//
//  ProfileSummary.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-08.
//

import SwiftUI

struct ProfileSummary: View {
    
    //@Environment(ModelData.self) var modelData
    
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image("turtlerock")
                        .clipShape(Circle())
                        .padding()
                }
                
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                //Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView () {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: ModelData().hikes[0])
                    
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
