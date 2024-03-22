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
    
    var hasPressAnimation = true
    var hasHapticFeedback = true
    
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
        hasPressAnimation && didLongPress || didHover ? .black.opacity(0.25) : .black.opacity(0)
    }
    
    var cfLabel: (_ type: LabelType, _ color: Color, _: Expandable) -> T?
    var action: () -> ()

    public var body: some View {
        Button {
            #if os(iOS)
            if hasHapticFeedback { Haptics.impact(.light).run() }
            #endif
            action()
        } label: {
            ZStack {
                #if os(iOS)
                    RoundedRectangle(cornerRadius: type.radius)
                        .shadow(color: shadowColor,
                                radius: hasPressAnimation && didLongPress ? 1 : 3,
                                x: 0,
                                y: 2)
                    RoundedRectangle(cornerRadius: type.radius)
                        .blendMode(.destinationOut)
                    RoundedRectangle(cornerRadius: type.radius, style: .continuous)
                        .fill(.clear)
                #endif
                cfLabel(type.asLabelType, displayColor, expandable)
                    .contentShape(Rectangle())
                    .padding(.top, hasPressAnimation && didLongPress ? .cfSpacing(.xxsmall) : .zero)
                    
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

public extension CFButton where T == CFLabel {
    init(title: String, type: CFButtonType = .blockFill, size: CFButtonSize = .small, color: CFColor = .primaryScale(.primary(.base)), width: CGFloat? = nil, hasPressAnimation: Bool = true, hasHapticFeedback: Bool = true, action: @escaping () -> ()) {
        
        var fontStyle: CFLabelFontStyle
        
        switch size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(type: type, size: size, width: width, hasPressAnimation: hasPressAnimation, hasHapticFeedback: hasHapticFeedback, displayColor: color.color) { type, color, expandable  in
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
    
    init(content: CFLabelData, type: CFButtonType = .blockFill, size: CFButtonSize = .small, color: CFColor = .primaryScale(.primary(.base)), width: CGFloat? = nil, hasPressAnimation: Bool = true, hasHapticFeedback: Bool = true, action: @escaping () -> ()) {
        var fontStyle: CFLabelFontStyle
        
        switch size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(size: size, width: width, hasPressAnimation: hasPressAnimation, hasHapticFeedback: hasHapticFeedback, displayColor: color.color) { type, color, expandable  in
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
        CFButton(title: "Test", type: .text, size: .xlarge, hasPressAnimation: false) {
            print("HHHH")
        }
    }
    .padding(.cfFrame(.medium))
    .background(Color.white)
}
