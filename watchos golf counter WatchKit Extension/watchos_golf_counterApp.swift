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
    @State var viewNo = ViewNoList.countViewNo.rawValue
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch viewNo {
                case ViewNoList.scoreViewNo.rawValue:
                    ScoreView()
                case ViewNoList.countViewNo.rawValue:
                    CountView(viewNo: $viewNo)
                case ViewNoList.resetViewNo.rawValue:
                    ResetView(viewNo: $viewNo)
                default:
                    CountView(viewNo: $viewNo)
                }
            }
            .environmentObject(globalScores)
            .environmentObject(countState)
            .gesture(DragGesture(minimumDistance: 50)
                        .onEnded() { value in
                            if (value.translation.width < 0 && ViewNoList.scoreViewNo.rawValue < viewNo ) {
                                viewNo = viewNo - 1
                            } else if (value.translation.width > 0 && viewNo < ViewNoList.resetViewNo.rawValue ) {
                                viewNo = viewNo + 1
                            }
                        })
        }
    }
}
