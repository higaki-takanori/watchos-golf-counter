//
//  ContentView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/11.
//

import SwiftUI

struct CountView: View {
    
    @EnvironmentObject private var globalScores :GlobalScores
    @EnvironmentObject private var countState :CountState
//    @Binding var viewNo: Int
    
    let HoleArray = ["1H", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "11H", "12H", "13H", "14H", "15H", "16H", "17H", "18H"]
       
    var body: some View {
        ZStack {
            Color (countState.watchColor)
                .edgesIgnoringSafeArea(.all)

// HoleNo Picker
            VStack {
                Picker("", selection: $countState.HoleNo) {
                    ForEach(0 ..< HoleArray.count) { num in
                        Text(self.HoleArray[num]).tag(num+1)
                    }
                }
            }.frame(width: 90.0, height: 50.0).position(x: 50, y: 10)
            
// PAR Picker
            VStack {
                Picker("", selection: $countState.ParNo) {
                    Text("PAR3").tag(3)
                    Text("PAR4").tag(4)
                    Text("PAR5").tag(5)
                }
            }.frame(width: 90.0, height: 50.0).position(x: 150, y: 10)
            
// Score Text
            Text("\(countState.Score)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .position(x: 100, y: 70)
            
// Putter Text
            Text("( \(countState.Putter) )")
                .font(.title2)
                .position(x: 100, y: 110)

// Plus Botton
            Button(action: {
                knock(type: WKHapticType(rawValue: 7))
                countState.Score = countState.Score + 1
                if countState.isPutter {
                    countState.Putter = countState.Putter + 1
                }
            }) {
                Text("+")
            }.frame(width: 90.0, height: 150.0).position(x: 160, y: 90)
                .buttonStyle(PlusbtnStyle())
            
// Minus Botton
            Button(action: {
                if countState.isPutter {
                    if 0 < countState.Putter {
                        knock(type: WKHapticType(rawValue: 7))
                        countState.Score = countState.Score - 1
                        countState.Putter = countState.Putter - 1
                    }
                    
                } else {
                    if 1 < countState.Score && countState.Putter < countState.Score {
                        knock(type: WKHapticType(rawValue: 7))
                        countState.Score = countState.Score - 1
                    }
                }
            }) {
                Text("-")
            }.frame(width: 70.0, height: 150.0).position(x: 40, y: 90)
                .buttonStyle(MinusbtnStyle())
            
            
// Putter Button
            Button(action: {
                knock(type: WKHapticType(rawValue: 7))
                if countState.isPutter {
                    countState.watchColor = UIColor.black
                    countState.isPutter = false
                } else {
                    countState.watchColor = UIColor.init(_colorLiteralRed: 2.0, green: 6.0, blue: 9.0, alpha: 0.1)
                    countState.isPutter = true
                }
                
            }) {
                Image("putter")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .opacity(countState.isPutter ? 1 : 0.4)
                
            }.frame(width: 80.0, height: 50.0).position(x: 50, y: 170)
            
            
// Save Button
            Button(action: {
                knock(type: WKHapticType(rawValue: 7))
                globalScores.Score[countState.HoleNo-1] = countState.Score
                globalScores.Putter[countState.HoleNo-1] = countState.Putter
                globalScores.ParNo[countState.HoleNo-1] = countState.ParNo
                if countState.HoleNo < 18 {
                    countState.nextHole()
                } else {
//                    viewNo = ViewNoList.scoreViewNo.rawValue
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

func knock(type: WKHapticType?) {
    guard let hType = type else { return }
    WKInterfaceDevice.current().play(hType)
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountView()
//    }
//}
