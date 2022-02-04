//
//  ViewNoList.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/17.
//

import Foundation

final class ViewNo: ObservableObject {
    @Published var currentNo: Int = ViewNoList.countViewNo.rawValue
}

enum ViewNoList: Int {
    case scoreViewNo = 0
    case countViewNo = 1
    case settingViewNo = 2
}
