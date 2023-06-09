//
//  ContentDetailView.swift
//  Learning
//
//  Created by Finn Hougaard on 20/03/2023.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            // TODO: Description
            
            // Next lesson button - if there is a next lesson
            if model.hasNextLesson() {
                Button(
                    action: {
                        model.nextLesson()
                    },
                    label: {
                        let nextTitle = model.currentModule!.content.lessons[model.currentLessonIndex+1].title
                        
                        ZStack {
                            Rectangle()
                                .frame(height: 48)
                                .foregroundColor(Color.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            Text("Next lesson: \(nextTitle)")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    })
            }
        }
        .padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
