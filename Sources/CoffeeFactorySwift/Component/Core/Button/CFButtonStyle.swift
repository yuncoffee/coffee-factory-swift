//
//  File.swift
//  
//
//  Created by yuncoffee on 3/22/24.
//

import Foundation
import SwiftUI

public enum CFButtonType {
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

public enum CFButtonSize {
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