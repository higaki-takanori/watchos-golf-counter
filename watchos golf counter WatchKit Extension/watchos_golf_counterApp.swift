//
//  watchos_golf_counterApp.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/11.
//

import SwiftUI

@main
struct watchos_golf_counterApp: App {
    
    var globalScores = GlobalScores()
    var countState = CountState()
    @State private var ViewNo = ViewNoList.countViewNo.rawValue
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch ViewNo {
                case ViewNoList.scoreViewNo.rawValue:
                    ScoreView()
                case ViewNoList.countViewNo.rawValue:
                    CountView()
                case ViewNoList.resetViewNo.rawValue:
                    ResetView()
                default:
                    CountView()
                }
            }
            .environmentObject(globalScores)
            .environmentObject(countState)
            .gesture(DragGesture(minimumDistance: 50)
                        .onEnded() { value in
                            if (value.translation.width < 0 && ViewNoList.scoreViewNo.rawValue < ViewNo ) {
                                ViewNo = ViewNo - 1
                            } else if (value.translation.width > 0 && ViewNo < ViewNoList.resetViewNo.rawValue ) {
                                ViewNo = ViewNo + 1
                            }
                        })
        }
    }
}
