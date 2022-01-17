//
//  ScoreView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/12.
//

import SwiftUI

struct ScoreView: View {
    
    @StateObject var Scores = GlobalScores()
    
    var body: some View {
        List {
            Text("Total    \(Scores.Score.reduce(0, +)) ( \(Scores.Putter.reduce(0, +)) )")
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0.001, saturation: 1.0, brightness: 1.0))
            
            ForEach(0..<18) { (row: Int) in
                Text("\(row+1)H  PAR\(Scores.ParNo[row])  \(Scores.Score[row]) ( \(Scores.Putter[row]) )")
                
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
