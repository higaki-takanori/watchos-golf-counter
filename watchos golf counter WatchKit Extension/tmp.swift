//
//  tmp.swift
//  watchos golf counter WatchKit Extension
//
//  Created by 檜垣貴仁 on 2022/01/17.
//

import SwiftUI

struct tmp: View {
    var body: some View {
        NavigationView {
                    NavigationLink(destination: SecondView()) {
                        Text("画面切り替え")
                    }
        }.gesture(DragGesture(minimumDistance: 5)
                    
        )
    }
}

struct SecondView: View {
    var body: some View {
        Text("2個目の画面")
    }
}


struct tmp_Previews: PreviewProvider {
    static var previews: some View {
        tmp()
    }
}
