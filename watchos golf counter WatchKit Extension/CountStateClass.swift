//
//  GlobalCounterClass.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/17.
//

import Foundation
import SwiftUI

class CountState: ObservableObject {
    @Published var watchColor = UIColor.black
    @Published var HoleNo = 1
    @Published var ParNo = 4
    @Published var Score = 1
    @Published var Putter = 0
    @Published var isPutter = false
        
    func initCountState() {
        self.watchColor = UIColor.black
        self.HoleNo = 1
        self.ParNo = 4
        self.Score = 1
        self.Putter = 0
        self.isPutter = false
    }
    
    func nextHole() {
        self.watchColor = UIColor.black
        self.HoleNo = self.HoleNo + 1
        self.ParNo = 4
        self.Score = 1
        self.Putter = 0
        self.isPutter = false

    }
}
