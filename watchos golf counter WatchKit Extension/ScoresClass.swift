//
//  ScoresClass.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/12.
//

import Foundation

class GlobalScore: ObservableObject {
    @Published var Score = [Int](repeating:0, count: 18)
    @Published var Putter = [Int](repeating:0, count: 18)
    @Published var ParNo = [Int](repeating:0, count: 18)
}
