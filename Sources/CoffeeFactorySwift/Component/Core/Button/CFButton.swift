//
//  SwiftUIView.swift
//  
//
//  Created by yuncoffee on 1/23/24.
//

import SwiftUI

public struct CFButton: View {
    var action: () -> ()
    
    public var body: some View {
        Button {
            action()
        } label: {
            Label("Hello", systemImage: "ff")
        }

    }
}

#Preview {
    CFButton {
        print("Hello?")
    }
}
