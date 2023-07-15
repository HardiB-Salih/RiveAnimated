//
//  HomeView.swift
//  RiveAnimated
//
//  Created by HardiB.Salih on 7/15/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                content
            }
        }
    }
    
    var content :some View {
        VStack (spacing: 0){
            VStack {
                Text("Courses")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(courses) { course in
                        VCard(course: course)
                    }
                } .padding(20)
                    .padding(.bottom, 10)
            }
            
            VStack {
                Text("Recent")
                    .customFont(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 20) {
                    ForEach(courseSections) { section in
                        HCard(section: section)
                    }
                }
            }
            .padding(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
