//
//  watchos_golf_counterApp.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/11.
//

import SwiftUI

@main
struct watchos_golf_counterApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ContentView()
                ScoreView()
            }
        }
    }
}
