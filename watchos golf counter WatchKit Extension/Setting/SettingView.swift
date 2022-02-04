//
//  SettingView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/31.
//

import SwiftUI

struct SettingView: View {
    
//    @EnvironmentObject private var globalScores :GlobalScores
//    @EnvironmentObject private var countState :CountState
//    @EnvironmentObject private var viewNo :ViewNo
//    @State private var isReset = false
    
    var body: some View {
        List {
            ResetView()
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView(viewNo: ViewNoList.scoreViewNo.rawValue)
//    }
//}
