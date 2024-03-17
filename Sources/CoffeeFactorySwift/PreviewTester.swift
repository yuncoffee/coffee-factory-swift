//
//  File.swift
//
//
//  Created by yuncoffee on 3/11/24.
//

import Foundation
import SwiftUI

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        let sixteenToNineRatio: CGSize = .cfRatio(200, ratio: .fourToFive)
        
        VStack {
            Image(systemName: "star.fill")
                .background(Color.blue)
                .frame(width: sixteenToNineRatio.width, height: sixteenToNineRatio.height)
                .background(Color.green)
            Text("HELLO")
            Text("WORLD")
        }
        .pretendard(.largeTitle)
        .frame(320, ratio: .nineToSixteen)
        .background(Color.yellow)
        .frame(width: 640,height: 500)
        .background(Color.blue)
        .padding(24)
    }
}
