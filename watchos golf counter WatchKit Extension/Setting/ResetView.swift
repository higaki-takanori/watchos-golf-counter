//
//  ResetView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/12.
//

import SwiftUI

struct ResetView: View {
    
    @EnvironmentObject private var globalScores :GlobalScores
    @EnvironmentObject private var countState :CountState
    @EnvironmentObject private var viewNo :ViewNo
    
    @State private var isReset = false
    
    var body: some View {
        if isReset {
            ZStack {
                List {
                    Button(action: {
                        globalScores.initGlobalScores()
                        countState.initCountState()
                        viewNo.currentNo = ViewNoList.countViewNo.rawValue
                    }) {
                        Text("Reset")
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                    }
                    Button(action: {
                        isReset = false
                    }) {
                        Text("Cancel")
                    }
                }
            }
        } else {
            ZStack {
                List {
                    Button(action: {
                        isReset = true
                    }) {
                        Text("Score Reset")
                            .fontWeight(.bold)
                    }
                }
            }
        }
        
    }
}

//struct ResetView_Previews: PreviewProvider {
//    @Binding var ViewNo: Int
//    static var previews: some View {
//        ResetView(ViewNo: 2)
//    }
//}
