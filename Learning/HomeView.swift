//
//  ContentView.swift
//  Learning
//
//  Created by Finn Hougaard on 16/03/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Get started")
                    .font(.largeTitle)
                    .padding(.leading, 20)
                    .bold()
                Text("What do you want to do today ?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            VStack (spacing: 20) {
                                NavigationLink(
                                    destination:
                                        ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                        }),
                                    label: {
                                        // Learning card
                                        HomeViewRow(
                                            image: module.content.image,
                                            title: "Learn \(module.category)",
                                            description: module.content.description,
                                            count: "\(module.content.lessons.count) Lessons",
                                            time: module.content.time)
                                    })
                                
                                // Test card
                                HomeViewRow(
                                    image: module.test.image,
                                    title: "\(module.category) Test",
                                    description: module.test.description,
                                    count: "\(module.test.questions.count) Questions",
                                    time: module.test.time)
                            }
                        }
                    }
                    .padding()
                    .accentColor(.black)
                }
            }
            .navigationTitle("Get started")
        }
        .navigationViewStyle(.stack)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
