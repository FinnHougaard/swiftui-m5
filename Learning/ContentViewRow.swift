//
//  ContentViewRow.swift
//  Learning
//
//  Created by Finn Hougaard on 20/03/2023.
//

import SwiftUI

struct ContentViewRow: View {
    @EnvironmentObject var model: ContentModel
    var index: Int
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        // Display the lesson card
        ZStack (alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            HStack(spacing: 30) {
                Text(String(index+1))
                    .bold()
                VStack(alignment: .leading) {
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                }
            }
            .padding(.leading)
        }
        .padding(.bottom, 10)
    }
}
/*
struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRow()
    }
}
*/
