//
//  SettingView.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/31.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("setting", destination: CountView())
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
