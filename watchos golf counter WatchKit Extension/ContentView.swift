//
//  ContentView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/02/04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewNo: ViewNo
    
    var body: some View {
        TabView(selection: $viewNo.currentNo) {
            ScoreView().tag(ViewNoList.scoreViewNo.rawValue)
            CountView().tag(ViewNoList.countViewNo.rawValue)
            SettingView().tag(ViewNoList.settingViewNo.rawValue)
        }
        .tabViewStyle(PageTabViewStyle())
        //            .environmentObject(globalScores)
        //            .environmentObject(countState)
        .environmentObject(viewNo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
