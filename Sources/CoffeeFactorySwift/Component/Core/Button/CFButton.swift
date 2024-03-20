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
    @State var color: Color = .cf(.primaryScale(.primary(.base)))
    
    var expandable: Expandable = true
    
    var width: CGFloat?
    
    var cfLabel: (_ type: LabelType, _ color: Color, _: Expandable) -> T?
    var action: () -> ()

    @State var isHover = false
    
    public var body: some View {
        Button {
            action()
        } label: {
            cfLabel(type.asLabelType, color, expandable)
        }
        .buttonStyle(CFButtonStyle(type: type, size: size, color: color))
        .padding(.horizontal, .cfSpacing(.xxxsmall))
        .padding(.top, .zero)
        .frame(maxWidth: width != nil ? width : .infinity,
               minHeight: size.height,
               maxHeight: size.height)
        .onHover { hovering in
            withAnimation {
                isHover = hovering
            }
        }
        .onChange(of: isHover) { isHover in
            withAnimation {
                color = isHover 
                ? .cf(.primaryScale(.primary(.dark)))
                : .cf(.primaryScale(.secondary(.dark)))
            }
        }
    }
}

extension CFButton where T == CFLabel {
    init(title: String, type: CFButtonType = .blockFill, size: CFButtonSize = .small, color: Color = .cf(.primaryScale(.primary(.base))), width: CGFloat? = nil, action: @escaping () -> ()) {
        
        var fontStyle: CFLabelFontStyle
        
        switch size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(type: type, size: size, width: width) { type, color, expandable  in
            CFLabel(content: .init(title),
                    type: type,
                    color: color,
                    expandable: expandable,
                    fontStyle: fontStyle,
                    padding: .init(v: 0, h: 6))
        } action: {
            action()
        }
    }
    
    init(content: CFLabelData, type: CFButtonType = .blockFill, size: CFButtonSize = .small, color: Color = .cf(.primaryScale(.primary(.base))), action:  @escaping () -> ()) {
        var fontStyle: CFLabelFontStyle
        
        switch size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(size: size) { type, color, expandable  in
            CFLabel(content: content,
                    type: type,
                    color: color,
                    expandable: expandable, 
                    fontStyle: fontStyle,
                    padding: .init(v: 0, h: 6))
        } action: {
            action()
        }
    }
    
}

#Preview {
    VStack {
        CFButton(title: "HELLOWORLD", width: 120) {
            print("HELLO WORLD!")
        }
        .border(.red)
        CFButton(content: .init("Test", icon: "star.fill")) {
            print("HELLO WORLD!")
        }
        .border(.red)
        CFButton { type, color, expandable  in
            CFLabel(content: .init("HELLO WORLD!"), expandable: expandable)
        } action: {
            print("Tester")
        }
        .border(.red)
        CFButton(title: "Test", type: .boxLine, size: .xlarge) {
            print("HHHH")
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
    
    var height: CGFloat {
        switch self {
        case .xsamll:
            28
        case .small:
            32
        case .medium:
            36
        case .large:
            40
        case .xlarge:
            48
        }
    }
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
            .frame(maxWidth: .infinity, maxHeight: size.height)
    }
}
