//
//  PageView.swift
//  SwiftUI_Landmarks
//
//  Created by lichengwu on 2024-05-09.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    @State private var currentPage = 2
    @State private var changeIndexFlag: Bool = false
    
    var body: some View {
        VStack {
            /*Button {
                self.changeIndexFlag.toggle()
                if self.changeIndexFlag {
                    currentPage = 0
                } else {
                    currentPage = 2
                }
            } label: {
                Image(systemName: "play.rectangle")
                Text("Switch");
            }
            .font(.title)
            .padding()
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(50).padding(10)*/
            
            ZStack(alignment: .bottomTrailing) {
                PageViewController(pages: pages, currentPage: $currentPage)
                PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                    .frame(width: CGFloat(pages.count * 18))
                    .padding(.trailing)
            }
            .aspectRatio(3 / 2, contentMode: .fit)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0)})
    }
}
