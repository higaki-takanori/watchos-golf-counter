//
//  ContentView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Plusbtn = "+"
    @State private var Minusbtn = "-"
    @State private var watchColor = UIColor.black
    @State private var HoleNo = 1
    @State private var ParNo = 3
    @State private var Score = 1
    @State private var Putter = 0
    @State private var isPutter = false

    var body: some View {
        ZStack {
            Color (watchColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Picker("", selection: $HoleNo) {
                    Text("1H").tag(1)
                    Text("2H").tag(2)
                    Text("3H").tag(3)
                    Text("4H").tag(4)
                    Text("5H").tag(5)
                    Text("6H").tag(6)
                    Text("7H").tag(7)
                    Text("8H").tag(8)
                    Text("9H").tag(9)
//                    Text("10H").tag(10)
//                    Text("11H").tag(11)
//                    Text("12H").tag(12)
//                    Text("13H").tag(13)
//                    Text("14H").tag(14)
//                    Text("15H").tag(15)
//                    Text("16H").tag(16)
//                    Text("17H").tag(17)
//                    Text("18H").tag(18)
                }
            }.frame(width: 90.0, height: 50.0).position(x: 50, y: 10)
            
            VStack {
                Picker("", selection: $watchColor) {
                    Text("PAR3").tag(3)
                    Text("PAR4").tag(4)
                    Text("PAR5").tag(5)
                }
            }.frame(width: 90.0, height: 50.0).position(x: 150, y: 10)
            
            Text("\(Score)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .position(x: 100, y: 70)
            
            Text("( \(Putter) )")
                .font(.title2)
                .position(x: 100, y: 110)
            
            Button(action: {
                Score = Score + 1
                if isPutter {
                    Putter = Putter + 1
                }
            }) {
                Text("+")
            }.frame(width: 90.0, height: 150.0).position(x: 160, y: 90)
                .buttonStyle(PlusbtnStyle())
            
            
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
            
            Button(action: {
                if isPutter {
                    watchColor = UIColor.black
                    isPutter = false
                } else {
                    watchColor = UIColor.init(_colorLiteralRed: 2.0, green: 6.0, blue: 9.0, alpha: 0.1)
                    isPutter = true
                }
                
            }) {
                Image("putter").renderingMode(.original)
            }.frame(width: 80.0, height: 50.0).position(x: 50, y: 170)
            
            Button(action: {
                print("tmp")
            }) {
                Text("Save")
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

struct PutterbtnStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
