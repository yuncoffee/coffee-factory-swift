//
//  File.swift
//  
//
//  Created by yuncoffee on 3/17/24.
//

import Foundation

protocol StyleEssential {
    associatedtype ComponentType
    associatedtype ComponentSize
    associatedtype ComponentColor
    
    var type: ComponentType { get }
    var size: ComponentSize { get }
    var color: ComponentColor { get }
}

protocol StyleConfiguration: StyleEssential {
    associatedtype ConfigurationType
    var configuration: ConfigurationType { get }
}

enum ComponentCornerBlockStyle {
    case systemValue(CFRadius)
    case customValue(CGFloat)
}

/// default - fillStyle: .fill, corenrStyle: .box
public struct ComponentStyle {
    var cornerStyle: ComponentCornerStyle = .box
    var fillStyle: ComponentFillStyle = .fill
    
    /// 컴포넌트 라운딩 스타일
    enum ComponentCornerStyle {
        /// 기본적인 라운딩 스타일 rawValue = 8
        ///
        /// ```
        /// cornerRadius: CGFloat.CFRadius.small
        /// ```
        case block(ComponentCornerBlockStyle = .systemValue(.small))
        /// 라운딩 미적용 rawValue = 0
        ///
        /// ```
        /// cornerRadius: 0
        /// ```
        case box
        /// 원형 라운딩 스타일 rawValue = 100
        ///
        /// ```
        /// cornerRadius: 100
        /// ```
        case round
        
        
        var cornerRadius: CGFloat {
            switch self {
            case .block(let radius):
                switch radius {
                case .systemValue(let cfRadius):
                    return cfRadius.rawValue
                case .customValue(let cgFloat):
                    return cgFloat
                }
            case .box:
                return 0
            case .round:
                return CGFloat.cfRadius(.round)
            }
        }
    }
    
    /// 컴포넌트 외형 스타일
    enum ComponentFillStyle: Int, CaseIterable {
        /// 기본적인 외형 스타일로 설정한 컬러를 배경색으로 채움
        ///
        /// ```
        /// fill: .yourColor
        /// stroke: .yourColor
        /// text: .systemWhite
        /// ```
        case fill
        /// 설정한 컬러를 스트로크에 전경색으로 채우고 배경색은 채우지 않음
        ///
        /// ```
        /// fill: .clear
        /// stroke: .yourColor
        /// text: .yourColor
        /// ```
        case line
        /// 호버 시 fill Style 호버하지 않을 경우 text Style
        ///
        /// ```
        /// fill: isHover ? .yourColor : .clear
        /// stroke: isHover ? .yourColor : .clear
        /// text: isHover ? .systemWhite : .yourColor
        /// ```
        case ghost
        /// 설정한 컬러를 텍스트에만 전경색으로 채움
        ///
        /// ```
        /// fill: .clear
        /// stroke: .clear
        /// text: .yourColor
        /// ```
        case text
        /// 설정한 스타일이 없음
        case none
    }
}

extension ComponentStyle.ComponentFillStyle {
    func isLook(_ style: ComponentStyle.ComponentFillStyle) -> Bool {
        self == style
    }
}

extension ComponentStyle.ComponentCornerStyle {
    func isLook(_ style: ComponentStyle.ComponentCornerStyle) -> Bool {
        switch self {
        case .block:
            if case .block = style { return true }
        case .box:
            if case .box = style { return true }
        case .round:
            if case .round = style { return true }
        }
        return false
    }
}

protocol ComponentBaseType {
    static func blockFill(_ : ComponentCornerBlockStyle) -> Self
    static func blockLine(_ : ComponentCornerBlockStyle) -> Self
    static var boxFill: Self { get }
    static var boxLine: Self { get }
    static var roundFill: Self { get }
    static var roundLine: Self { get }
    static var text: Self { get }
    
    var style: ComponentStyle? { get }
}

protocol ComponentBaseSize {
    static var small: Self { get }
    static var medium: Self { get }
    static var large: Self { get }
}

enum BaseType: ComponentBaseType {
    case blockFill(ComponentCornerBlockStyle)
    case blockLine(ComponentCornerBlockStyle)
    case boxFill
    case boxLine
    case roundFill
    case roundLine
    case text
    
    var style: ComponentStyle? {
        switch self {
        case .blockFill:
            ComponentStyle(cornerStyle: .block(.systemValue(.small)))
        case .blockLine:
            ComponentStyle(cornerStyle: .block(.systemValue(.small)), fillStyle: .line)
        case .boxFill:
            ComponentStyle()
        case .boxLine:
            ComponentStyle(fillStyle: .line)
        case .roundFill:
            ComponentStyle(cornerStyle: .round)
        case .roundLine:
            ComponentStyle(cornerStyle: .round, fillStyle: .line)
        case .text:
            ComponentStyle(fillStyle: .text)
        }
    }
}

enum BaseSize: ComponentBaseSize {
    case small
    case medium
    case large
}
