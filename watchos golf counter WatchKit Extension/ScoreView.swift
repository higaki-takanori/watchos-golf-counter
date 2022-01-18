//
//  ScoreView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/12.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject private var globalScores :GlobalScores
    
    var body: some View {
        List {
            Text("Total    \(globalScores.Score.reduce(0, +)) ( \(globalScores.Putter.reduce(0, +)) )")
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0.001, saturation: 1.0, brightness: 1.0))
            
            ForEach(0..<18) { (row: Int) in
                Text("\(row+1)H  PAR\(globalScores.ParNo[row])  \(globalScores.Score[row]) ( \(globalScores.Putter[row]) )")                
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
