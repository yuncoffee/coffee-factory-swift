//
//  SwiftUIView.swift
//
//
//  Created by yuncoffee on 1/29/24.
//

import SwiftUI

public struct CFLabelData {
    var text: String
    var icon: String?
    
    public init(_ text: String, icon: String? = nil) {
        self.text = text
        self.icon = icon
    }
    
    var systemImage: String {
        icon ?? "square.split.diagonal.2x2"
    }
}

public struct CFLabel: View, StyleEssential, LabelStyleEssential {
    var content: CFLabelData
    
    var type: LabelType = .text
    var size: LabelSize = .body
    var color: Color = .cf(.grayScale(.black))
    
    var alignStyle: LabelAlignStyle = .textOnly
    var iconSize: CGFloat?
    var contentColor: Color?
    
    var expandable: Bool = false
    var fontStyle: CFLabelFontStyle?
    
    var width: CGFloat?
    var padding: CFPadding = .init(v: .cfSpacing(.xxxsmall), h: .cfSpacing(.xxsmall))
        
    public var body: some View {
        let _alignStyle = content.icon != nil && alignStyle != .textOnly 
        ? alignStyle
        : content.icon != nil
        ? .iconWithText
        : .textOnly
        
        Label(content.text, systemImage: content.systemImage)
            .labelStyle(
                CFLabelStyle(
                    type: type,
                    size: size,
                    color: color,
                    alignStyle: _alignStyle,
                    iconSize: iconSize,
                    contentColor: contentColor,
                    fontStyle: (fontStyle != nil) ? fontStyle! : size.defaultFont,
                    width: width, 
                    padding: padding,
                    expandable: expandable
                )
            )
    }
    
    public init(content: CFLabelData, type: LabelType = .text, size: LabelSize = .body, color: Color = .cf(.grayScale(.black)), alignStyle: LabelAlignStyle = .textOnly, iconSize: CGFloat? = nil, contentColor: Color? = nil, expandable: Bool = false, fontStyle: CFLabelFontStyle? = nil, width: CGFloat? = nil, padding: CFPadding = .init(v: .cfSpacing(.xxxsmall), h: .cfSpacing(.xxsmall))) {
        self.content = content
        self.type = type
        self.size = size
        self.color = color
        self.alignStyle = alignStyle
        self.iconSize = iconSize
        self.contentColor = contentColor
        self.expandable = expandable
        self.fontStyle = fontStyle
        self.width = width
        self.padding = padding
    }
}

#Preview {
    VStack {
        CFLabel(content: .init("Hello World"))
        
        CFLabel(content: .init("Sample with Text With Icon", icon: "star.fill"))
        
        CFLabel(content: .init("Sample with type"),
                type: .blockFill(.cfRadius(.xsmall))
        )
        
        CFLabel(content: .init("Sample with size"), 
                type: .blockLine(.cfRadius(.xxsmall)),
                size: .headline
        )
        
        CFLabel(content: .init("Sample with Color"),
                type: .blockFill(.cfRadius(.xxsmall)),
                color: .cf(.primaryScale(.secondary(.base)))
        )
        
    }
    .padding(.cfFrame(.large))
}
