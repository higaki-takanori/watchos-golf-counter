//
//  ContentView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/11.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var Scores :GlobalScores
    
    @State private var watchColor = UIColor.black
    @State private var HoleNo = 1
    @State private var ParNo = 3
    @State private var Score = 1
    @State private var Putter = 0
    @State private var isPutter = false
    let HoleArray = ["1H", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "11H", "12H", "13H", "14H", "15H", "16H", "17H", "18H"]
    
    var body: some View {
        ZStack {
            Color (watchColor)
                .edgesIgnoringSafeArea(.all)

// HoleNo Picker
            VStack {
                Picker("", selection: $HoleNo) {
                    ForEach(0 ..< HoleArray.count) { num in
                        Text(self.HoleArray[num]).tag(num+1)
                    }
                }
            }.frame(width: 90.0, height: 50.0).position(x: 50, y: 10)
            
// PAR Picker
            VStack {
                Picker("", selection: $ParNo) {
                    Text("PAR3").tag(3)
                    Text("PAR4").tag(4)
                    Text("PAR5").tag(5)
                }
            }.frame(width: 90.0, height: 50.0).position(x: 150, y: 10)
            
// Score Text
            Text("\(Score)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .position(x: 100, y: 70)
            
// Putter Text
            Text("( \(Putter) )")
                .font(.title2)
                .position(x: 100, y: 110)

// Plus Botton
            Button(action: {
                Score = Score + 1
                if isPutter {
                    Putter = Putter + 1
                }
            }) {
                Text("+")
            }.frame(width: 90.0, height: 150.0).position(x: 160, y: 90)
                .buttonStyle(PlusbtnStyle())
            
// Minus Botton
            Button(action: {
                if isPutter {
                    if 0 < Putter {
                        Score = Score - 1
                        Putter = Putter - 1
                    }
                    
                } else {
                    if 1 < Score && Putter < Score {
                        Score = Score - 1
                    }
                }
            }) {
                Text("-")
            }.frame(width: 70.0, height: 150.0).position(x: 40, y: 90)
                .buttonStyle(MinusbtnStyle())
            
            
// Putter Button
            Button(action: {
                if isPutter {
                    watchColor = UIColor.black
                    isPutter = false
                } else {
                    watchColor = UIColor.init(_colorLiteralRed: 2.0, green: 6.0, blue: 9.0, alpha: 0.1)
                    isPutter = true
                }
                
            }) {
                Image("putter")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .opacity(isPutter ? 1 : 0.4)
                
            }.frame(width: 80.0, height: 50.0).position(x: 50, y: 170)
            
            
// Save Button
            Button(action: {
                if HoleNo < 18 {
                    Scores.Score[HoleNo-1] = Score
                    Scores.Putter[HoleNo-1] = Putter
                    Scores.ParNo[HoleNo-1] = ParNo
                    
                    watchColor = UIColor.black
                    HoleNo = HoleNo + 1
                    ParNo = 3
                    Score = 1
                    Putter = 0
                    
                } else {
                    
                }
            }) {
                Image("save")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                
            }.frame(width: 80.0, height: 50.0).position(x: 150, y: 170)
            
        }
    }
}

struct PlusbtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.all, 20.0)
            .font(.largeTitle)
            .foregroundColor(Color.black)
            .background(Color.green)
            .cornerRadius(12.0)
    }
}

struct MinusbtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.all, 20.0)
            .font(.largeTitle)
            .foregroundColor(Color.black)
            .background(Color.red)
            .cornerRadius(12.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
