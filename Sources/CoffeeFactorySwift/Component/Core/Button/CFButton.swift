//
//  SwiftUIView.swift
//  
//
//  Created by yuncoffee on 1/23/24.
//

import SwiftUI

public protocol ButtonComposable {}

extension CFLabel: ButtonComposable {}
extension EmptyView: ButtonComposable {}


public struct CFButton<T: View>: StyleEssential, View where T: ButtonComposable {
    var type: CFButtonType = .blockFill
    var size: CFButtonSize = .small
    var color: Color = .cf(.primaryScale(.primary(.base)))
    
    var cfLabel: (_ type: LabelType) -> T?
    var action: () -> ()

    public var body: some View {
        Button {
            action()
        } label: {
            cfLabel(type.asLabelType)
        }
        .buttonStyle(CFButtonStyle(type: type, size: size, color: color))
    }
}

extension CFButton where T == CFLabel {
    init(title: String, action: @escaping () -> ()) {
        self.init { type in
            CFLabel(content: .init(title), type: type)
        } action: {
            action()
        }
    }
    
    init(content: CFLabelData, color: Color, action:  @escaping () -> ()) {
        self.init { type in
            CFLabel(content: content, type: type, color: color)
        } action: {
            action()
        }
    }
    
}

#Preview {
    VStack {
        CFButton<EmptyView> { type in
            EmptyView()
        } action: {
            print("HELLO")
        }
        CFButton(title: "HELLOWORLD") {
            print("HELLO WORLD!")
        }
        CFButton(content: .init("Test", icon: "star.fill"), color: .blue) {
            print("HELLO WORLD!")
        }
        CFButton { type in
            CFLabel(content: .init("HELLO WORLD!"))
        } action: {
            print("Tester")
        }

    }
    .padding(.cfFrame(.medium))
}

enum CFButtonType {
    case blockFill
    case blockLine
    case boxFill
    case boxLine
    case roundFill
    case roundLine
    case text
    
    var style: ComponentStyle? {
        switch self {
        case .blockFill:
            return ComponentStyle(cornerStyle: .block(.cfRadius(.xsmall)))
        case .blockLine:
            return ComponentStyle(cornerStyle: .block(.cfRadius(.xsmall)), fillStyle: .line)
        case .boxFill:
            return ComponentStyle()
        case .boxLine:
            return ComponentStyle(fillStyle: .line)
        case .roundFill:
            return ComponentStyle(cornerStyle: .round)
        case .roundLine:
            return ComponentStyle(cornerStyle: .round, fillStyle: .line)
        case .text:
            return ComponentStyle(fillStyle: .text)
        }
    }
    
    var asLabelType: LabelType {
        switch self {
        case .blockFill:
            return .blockFill(.cfRadius(.xsmall))
        case .blockLine:
            return .blockLine(.cfRadius(.xsmall))
        case .boxFill:
            return .boxFill
        case .boxLine:
            return .boxLine
        case .roundFill:
            return .roundFill
        case .roundLine:
            return .roundLine
        case .text:
            return .text
        }
    }
}

enum CFButtonSize {
    case xsamll
    case small
    case medium
    case large
    case xlarge
}



struct CFButtonStyle: ButtonStyle, StyleEssential {
    var type: CFButtonType
    var size: CFButtonSize
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        CFButtonContent(configuration: configuration, type: type, size: size, color: color)
    }
}

struct CFButtonContent: View, StyleConfiguration {
    var configuration: ButtonStyleConfiguration
    
    var type: CFButtonType
    var size: CFButtonSize
    var color: Color
    
    var body: some View {
        configuration.label
            .border(.red)
    }
}
