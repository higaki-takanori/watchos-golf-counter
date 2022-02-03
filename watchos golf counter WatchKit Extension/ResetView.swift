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
//    @Binding var viewNo: Int

    @State private var isReset = false
    
    var body: some View {
        NavigationView {
            if isReset {
                ZStack {
                    Button(action: {
                        globalScores.initGlobalScores()
                        countState.initCountState()
//                        viewNo = ViewNoList.countViewNo.rawValue
                    }) {
                        Text("Reset")
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                        
                    }.position(x: 100, y: 50)
                    
                    Button(action: {
                        isReset = false
                    }) {
                        Text("Cancel")
                    }.position(x: 100, y: 130)
                }
            } else {
                ZStack {
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
//        ResetView(ViewNo: $ViewNo)
//    }
//}
