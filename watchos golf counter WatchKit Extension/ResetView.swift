//
//  ResetView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/12.
//

import SwiftUI

struct ResetView: View {
    
    @State private var isReset = false
    @EnvironmentObject private var globalScores :GlobalScores
//    @Binding var ViewNo: Int
    
    var body: some View {
        NavigationView {
            if isReset {
                ZStack {
                    
                    Button(action: {
                        globalScores.Score = [Int](repeating:0, count: 18)
                        globalScores.Putter = [Int](repeating:0, count: 18)
                        globalScores.ParNo = [Int](repeating:0, count: 18)
//                        ViewNo = ViewNoList.countViewNo.rawValue
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

struct ResetView_Previews: PreviewProvider {
    static var previews: some View {
        ResetView()
    }
}
