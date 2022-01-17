//
//  watchos_golf_counterApp.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/11.
//

import SwiftUI

@main
struct watchos_golf_counterApp: App {
    
    var Scores = GlobalScores()
//    @EnvironmentObject private var Scores :GlobalScores
    @State private var ViewNo = 1
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch ViewNo {
                case 0:
                    ScoreView()
                case 1:
                    ContentView()
                case 2:
                    ResetView()
                default:
                    ContentView()
                }
            }.environmentObject(Scores)
                .gesture(DragGesture(minimumDistance: 50).onEnded() { value in
                    if (value.translation.width < 0) {
                        ViewNo = ViewNo - 1
                    } else if (value.translation.width > 0) {
                        ViewNo = ViewNo + 1
                    }
                })
        }
    }
}
