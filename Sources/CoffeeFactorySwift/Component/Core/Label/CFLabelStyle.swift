//
//  File.swift
//  
//
//  Created by yuncoffee on 3/17/24.
//

import Foundation
import SwiftUI

protocol LabelStyleEssential {
    var alignStyle: LabelAlignStyle { get }
    var iconSize: CGFloat? { get }
    var contentColor: Color? { get }
}

enum LabelAlignStyle {
    case iconWithText
    case textWithIcon
    case iconOnly
    case textOnly
    case verticalIconWithText
}

enum LabelType: ComponentBaseType {
    case blockFill(ComponentCornerBlockStyle)
    case blockLine(ComponentCornerBlockStyle)
    case boxFill
    case boxLine
    case roundFill
    case roundLine
    case text
    case none
    
    var style: ComponentStyle? {
        switch self {
        case .blockFill:
            if case .blockFill(let radius) = self {
                return ComponentStyle(cornerStyle: .block(radius))
            }
        case .blockLine:
            if case .blockLine(let radius) = self {
                return ComponentStyle(cornerStyle: .block(radius), fillStyle: .line)
            }
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
        case .none:
            return nil
        }
        return nil
    }
}

enum LabelSize {
    case caption
    case title3
    case headline
    case body
    case display
    case title2
    case subTitle
    case caption2
    case largeTitle
    case title
    
    var height: CGFloat {
        switch self {
        case .caption:
            18
        case .title3:
            30
        case .headline:
            24
        case .body:
            21
        case .display:
            54
        case .title2:
            33
        case .subTitle:
            27
        case .caption2:
            15
        case .largeTitle:
            48
        case .title:
            36
        }
    }
}

public struct CFLabelStyle: LabelStyle, StyleEssential, LabelStyleEssential {
    var type: LabelType = .blockFill(.systemValue(.small))
    var size: LabelSize
    var color: Color = .clear
    
    var alignStyle: LabelAlignStyle = .textOnly
    var iconSize: CGFloat?
    var contentColor: Color?
    
    var fontStyle: (weight: Pretendard, scale: Pretendard.FontScale)
    var expandable: Bool = false
    var width: CGFloat?
    var padding: (v: CGFloat, h: CGFloat)
    
    public func makeBody(configuration: Configuration) -> some View {
        if let style = type.style {
            CFLabelContent(
                configuration: configuration,
                type: type,
                size: size,
                color: color,
                alignStyle: alignStyle
            )
            .pretendard(fontStyle.scale, weight: fontStyle.weight)
            .padding(.vertical, padding.v)
            .padding(.horizontal, padding.h)
            .frame(
                minWidth: width,
                maxWidth: expandable ? .infinity : nil,
                minHeight: size.height,
                maxHeight: expandable ? .infinity : nil
            )
            .background(
                style.fillStyle.isLook(.fill)
                ? color
                : .clear
            )
            .foregroundStyle(
                contentColor != nil 
                ? contentColor!
                : style.fillStyle.isLook(.fill)
                ? Color.cf(.grayScale(.white))
                : color
            )
            .overlay {
                RoundedRectangle(cornerRadius: style.cornerStyle.cornerRadius)
                    .stroke(style.fillStyle.isLook(.text) ? .clear : color, lineWidth: 2)
            }
            .clipShape(RoundedRectangle(cornerRadius: style.cornerStyle.cornerRadius))
        } else {
            HStack(spacing: .zero) {
                configuration.icon
                    .padding(.cfSpacing(.xxsmall))
                configuration.title
            }
        }
    }
}

struct CFLabelContent: View, StyleConfiguration, LabelStyleEssential {
    var configuration: LabelStyleConfiguration
    var type: LabelType
    var size: LabelSize
    var color: Color
    var alignStyle: LabelAlignStyle
    var iconSize: CGFloat?
    var contentColor: Color?

    var body: some View {
        switch alignStyle {
        case .verticalIconWithText:
            VStack(spacing: .zero) {
                if let iconSize {
                    configuration.icon
                        .font(.system(size: iconSize))
                        .padding(.cfSpacing(.xxsmall))
                    configuration.title
                } else {
                    configuration.icon
                        .padding(.cfSpacing(.xxsmall))
                    configuration.title
                }
            }
        case .iconWithText:
            HStack(spacing: .zero) {
                if let iconSize {
                    configuration.icon
                        .font(.system(size: iconSize))
                        .padding(.cfSpacing(.xxsmall))
                    configuration.title
                } else {
                    configuration.icon
                        .padding(.cfSpacing(.xxsmall))
                    configuration.title
                }
            }
        case .textWithIcon:
            HStack(spacing: .zero) {
                if let iconSize {
                    configuration.title
                    configuration.icon
                        .font(.system(size: iconSize))
                        .padding(.cfSpacing(.xxsmall))
                } else {
                    configuration.title
                    configuration.icon
                        .padding(.cfSpacing(.xxsmall))
                }
            }
        case .iconOnly:
            if let iconSize = iconSize {
                configuration.icon
                    .font(.system(size: iconSize))
                    .padding(.cfSpacing(.xxsmall))
            } else {
                configuration.icon
                    .padding(.cfSpacing(.xxsmall))
            }
        case .textOnly:
            configuration.title
        }
    }
}
