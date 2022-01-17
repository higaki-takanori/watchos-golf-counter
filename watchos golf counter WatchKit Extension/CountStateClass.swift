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
    @Published var ParNo = 3
    @Published var Score = 1
    @Published var Putter = 0
    @Published var isPutter = false
}
