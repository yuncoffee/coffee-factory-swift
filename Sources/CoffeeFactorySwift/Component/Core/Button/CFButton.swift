//
//  SwiftUIView.swift
//
//
//  Created by yuncoffee on 1/23/24.
//

import SwiftUI

public protocol ButtonComposable {}

extension CFLabel: ButtonComposable {}

public struct CFButton<T: View>: StyleEssential, View where T: ButtonComposable {
    var type: CFButtonType
    var size: CFButtonSize
    var color: CFColor
    
    var expandable: Expandable
    
    var width: CGFloat?
    
    var hasPressAnimation: Bool
    var hasHapticFeedback: Bool
    
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
        } onPressingChanged: { pressing in
            if hasPressAnimation {
                didLongPress = pressing
                displayColor = pressing
                ? pressColor
                : didHover
                ? hoverColor
                : color.color
            }
        }
    }
}

public extension CFButton where T == CFLabel {
    init(title: String, 
         style: CFButtonEssentialStyle = .init(),
         additionalStyle: CFButtonAdditionalStyle = .init(),
         configuration: CFButtonConfiguration = .init(),
         action: @escaping () -> ()) {

        var fontStyle: CFLabelFontStyle
        
        switch style.size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(type: style.type,
                  size: style.size,
                  color: style.color,
                  expandable: additionalStyle.expandable,
                  width: additionalStyle.width,
                  hasPressAnimation: configuration.hasPressAnimation,
                  hasHapticFeedback: configuration.hasHapticFeedback,
                  displayColor: style.color.color) { type, color, expandable  in
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
    
    init(content: CFLabelData,
         style: CFButtonEssentialStyle = .init(),
         additionalStyle: CFButtonAdditionalStyle = .init(),
         configuration: CFButtonConfiguration = .init(),
         action: @escaping () -> ()) {
        var fontStyle: CFLabelFontStyle
        
        switch style.size {
        case .xsamll:
            fontStyle = .init(scale: .caption)
        case .xlarge:
            fontStyle = .init(scale: .headline)
        default:
            fontStyle = .init(scale: .body)
        }
        
        self.init(type: style.type,
                  size: style.size,
                  color: style.color,
                  expandable: additionalStyle.expandable,
                  width: additionalStyle.width,
                  hasPressAnimation: configuration.hasPressAnimation,
                  hasHapticFeedback: configuration.hasHapticFeedback,
                  displayColor: style.color.color) { type, color, expandable  in
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
        CFButton(title: "HELLOWORLD", additionalStyle: .init(width: 120)) {
            print("HELLO WORLD!")
        }
        .border(.red)
        CFButton(content: .init("Test", icon: "star.fill")) {
            print("HELLO WORLD!")
        }
        CFButton(title: "Test", style: .init(type: .roundLine, size: .xlarge)) {
            print("HHHH")
        }
        CFButton(title: "Test", 
                 style: .init(type: .text, size: .xlarge),
                 configuration: .init(hasPressAnimation: false)) {
            print("HHHH")
        }
    }
    .padding(.cfFrame(.medium))
    .background(Color.white)
}
