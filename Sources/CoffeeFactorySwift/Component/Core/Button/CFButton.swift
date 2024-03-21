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
    var color: CFColor = .primaryScale(.primary(.base))
    
    var expandable: Expandable = true
    
    var width: CGFloat?
    
    @State private var displayColor: Color
    @State private var didLongPress = false
    @State private var didHover = false
    
    private var hoverColor: Color {
        color.nextColor(after: 1)
    }
    private var pressColor: Color {
        color.nextColor(after: 2)
    }
    private var shadowColor: Color {
        didLongPress || didHover ? .black.opacity(0.25) : .black.opacity(0)
    }
    
    var cfLabel: (_ type: LabelType, _ color: Color, _: Expandable) -> T?
    var action: () -> ()

    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                #if os(iOS)
                    RoundedRectangle(cornerRadius: type.radius)
                        .shadow(color: shadowColor,
                                radius: didLongPress ? 1 : 3,
                                x: 0,
                                y: 2)
                    RoundedRectangle(cornerRadius: type.radius)
                        .blendMode(.destinationOut)
                    RoundedRectangle(cornerRadius: type.radius, style: .continuous)
                        .fill(.clear)
                #endif
                cfLabel(type.asLabelType, displayColor, expandable)
                    .contentShape(Rectangle())
                    .padding(.top, didLongPress ? .cfSpacing(.xxsmall) : .zero)
                    
            }
            .compositingGroup()
        }
        .buttonStyle(CFButtonStyle(type: type, size: size, color: displayColor))
        .padding(.horizontal, .cfSpacing(.xxxsmall))
        .frame(maxWidth: width != nil ? width : .infinity,
               minHeight: size.height,
               maxHeight: size.height)
        .onHover { hovering in
            didHover = hovering
        }
        .onChange(of: didHover) { didHover in
            displayColor = didHover
            ? hoverColor
            : color.color
        }
        .onLongPressGesture(minimumDuration: 0.1) {
            print("HHHHHHHH")
        } onPressingChanged: { pressing in
            didLongPress = pressing
            displayColor = pressing
            ? pressColor
            : didHover
            ? hoverColor
            : color.color
        }
    }
    
    @available(macOS, unavailable)
    private func shadowEffect() -> some View {
        VStack {
            Text("HELLO")
        }
    }
}

extension CFButton where T == CFLabel {
    init(title: String, type: CFButtonType = .blockFill, size: CFButtonSize = .small, color: CFColor = .primaryScale(.primary(.base)), width: CGFloat? = nil, action: @escaping () -> ()) {
        
        var fontStyle: CFLabelFontStyle
        
        switch size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(type: type, size: size, width: width, displayColor: color.color) { type, color, expandable  in
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
    
    init(content: CFLabelData, type: CFButtonType = .blockFill, size: CFButtonSize = .small, color: CFColor = .primaryScale(.primary(.base)), action:  @escaping () -> ()) {
        var fontStyle: CFLabelFontStyle
        
        switch size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(size: size, displayColor: color.color) { type, color, expandable  in
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
        CFButton(title: "Test", type: .boxLine, size: .xlarge) {
            print("HHHH")
        }
        CFButton(title: "Test", type: .text, size: .xlarge) {
            print("HHHH")
        }
    }
    .padding(.cfFrame(.medium))
    .background(Color.white)
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
    
    var radius: CGFloat {
        switch self {
        case .blockFill:
                .cfRadius(.xsmall)
        case .blockLine:
                .cfRadius(.xsmall)
        case .boxFill:
                .cfRadius(.square)
        case .boxLine:
                .cfRadius(.square)
        case .roundFill:
                .cfRadius(.round)
        case .roundLine:
                .cfRadius(.round)
        case .text:
                .cfRadius(.square)
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
