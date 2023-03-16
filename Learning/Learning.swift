//
//  LearningApp.swift
//  Learning
//
//  Created by Finn Hougaard on 16/03/2023.
//

import SwiftUI

@main
struct Learning: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
